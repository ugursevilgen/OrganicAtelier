using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using OrganicAtelier.BLL.Abstract;
using OrganicAtelier.Entity;
using OrganicAtelier.WEBUI.Identity;
using OrganicAtelier.WEBUI.Models;
using System.Net;
using System;
using IyzipayCore.Request;
using IyzipayCore.Model;
using Options = IyzipayCore.Options;

namespace OrganicAtelier.WEBUI.Controllers
{
    [Authorize]
    public class CartController : Controller
    {
        private readonly ICartService _cartService;
        private readonly IOrderService _orderService;
        private readonly UserManager<ApplicationUser> _userManager;

        public CartController(ICartService cartService,IOrderService orderService, UserManager<ApplicationUser> userManager)
        {
            _cartService = cartService;
            _userManager = userManager;
            _orderService = orderService;
        }

        public IActionResult Index()
        {
            var cart = _cartService.GetCartUserId(_userManager.GetUserId(User));
            return View(cart);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult AddToCart(int productId, int quantity)
        {
            _cartService.AddToCart(_userManager.GetUserId(User), productId, quantity);
            return RedirectToAction("Index");
        }


        [HttpPost]
        public IActionResult DeleteProduct(int productId)
        {
            var cartId = _cartService.GetCartUserId(_userManager.GetUserId(User)).Id;

            var cartItem = _cartService.GetProductByCart(productId, cartId);
            if (cartItem == null)
            {
                return NotFound();
            }

            _cartService.Delete(cartItem);

            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult UpdateQuantity(int productId, int quantity)
        {
            var cartId = _cartService.GetCartUserId(_userManager.GetUserId(User)).Id;

            var cartItem = _cartService.GetProductByCart(productId, cartId);
            if (cartItem == null)
            {
                return NotFound();
            }

            // Yeni miktarı ayarlayın
            cartItem.Quantity = quantity;

            // Değişiklikleri kaydedin
            _cartService.Update(cartItem);

            // Yeni toplam fiyatı hesaplayın
            var totalPrice = cartItem.Quantity * cartItem.Product.Price;

            // Yeni toplam fiyatı döndürün
            return Content(totalPrice.ToString("c"));
        }

        public IActionResult TotalPrice()
        {
            var cart = _cartService.GetCartUserId(_userManager.GetUserId(User));
            var total = cart.CartItems.Sum(i => i.Product.Price * i.Quantity).ToString("c");
            var orderTotal = (cart.CartItems.Sum(i => i.Product.Price * i.Quantity) * (decimal)1.2).ToString("c");
            var tax = (cart.CartItems.Sum(i => i.Product.Price * i.Quantity) * (decimal)0.2).ToString("c");
            return Json(new { total, tax, orderTotal });

        }

        public IActionResult Checkout()
        {
            var cart = _cartService.GetCartUserId(_userManager.GetUserId(User));

            var orderModel = new OrderModel();

            orderModel.CartModel = new CartModel()
            {
                CartId = cart.Id,
                CartItems = cart.CartItems.Select(i => new CartItemModel()
                {
                    CartItemId = i.Id,
                    ProductId = i.Product.Id,
                    Title = i.Product.Title,
                    Price = i.Product.Price,
                    Image = i.Product.Image,
                    Quantity = i.Quantity
                }).ToList()
            };

            return View(orderModel);
        }

        [HttpPost]
        public IActionResult Checkout(OrderModel model)
        {
            ModelState.Remove("CartModel");
            if (ModelState.IsValid)
            {
                var userId = _userManager.GetUserId(User);
                var cart = _cartService.GetCartUserId(userId);

                model.CartModel = new CartModel()
                {
                    CartId = cart.Id,
                    CartItems = cart.CartItems.Select(i => new CartItemModel()
                    {
                        CartItemId = i.Id,
                        ProductId = i.Product.Id,
                        Title = i.Product.Title,
                        Price = i.Product.Price,
                        Image = i.Product.Image,
                        Quantity = i.Quantity
                    }).ToList()
                };


                //ödeme
                var payment = PaymentProcess(model);

                if (payment.Status == "success")
                {
                    //sipariş kayıt
                    SaveOrder(model, payment, userId);
                    ClearCart(cart.Id);
                    return View("Success");
                }

            }

            //sipariş
            return View(model);
        }

        public void ClearCart(int cartId)
        {
            _cartService.ClearCart(cartId);
        }

        private Payment PaymentProcess(OrderModel model)
        {
            Options options = new Options();
            options.ApiKey = "sandbox-A0FJYvo7hAleF1cAwNSYodVjELAj6EsB";
            options.SecretKey = "sandbox-OtWNn0GhKEKH0SVuwQcKYv1ZpEfDXCtD";
            options.BaseUrl = "https://sandbox-api.iyzipay.com";

            CreatePaymentRequest request = new CreatePaymentRequest();
            request.Locale = Locale.TR.ToString();
            request.ConversationId = "123456789";
            request.Price = model.CartModel.TotalPrice().ToString();
            request.PaidPrice = model.CartModel.TotalPrice().ToString();
            request.Currency = Currency.TRY.ToString();
            request.Installment = 1;
            request.BasketId = model.CartModel.CartId.ToString();
            request.PaymentChannel = PaymentChannel.WEB.ToString();
            request.PaymentGroup = PaymentGroup.PRODUCT.ToString();

            PaymentCard paymentCard = new PaymentCard();
            paymentCard.CardHolderName = model.CardName;
            paymentCard.CardNumber = model.CardNumber;
            paymentCard.ExpireMonth = model.ExpirationMonth;
            paymentCard.ExpireYear = model.ExpirationYear;
            paymentCard.Cvc = model.Cvv;
            paymentCard.RegisterCard = 0;
            request.PaymentCard = paymentCard;

            Buyer buyer = new Buyer();
            buyer.Id = "BY789";
            buyer.Name = "John";
            buyer.Surname = "Doe";
            buyer.GsmNumber = "+905350000000";
            buyer.Email = "email@email.com";
            buyer.IdentityNumber = "74300864791";
            buyer.LastLoginDate = "2015-10-05 12:43:35";
            buyer.RegistrationDate = "2013-04-21 15:12:09";
            buyer.RegistrationAddress = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            buyer.Ip = "85.34.78.112";
            buyer.City = "Istanbul";
            buyer.Country = "Turkey";
            buyer.ZipCode = "34732";
            request.Buyer = buyer;

            Address shippingAddress = new Address();
            shippingAddress.ContactName = "Jane Doe";
            shippingAddress.City = "Istanbul";
            shippingAddress.Country = "Turkey";
            shippingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            shippingAddress.ZipCode = "34742";
            request.ShippingAddress = shippingAddress;

            Address billingAddress = new Address();
            billingAddress.ContactName = "Jane Doe";
            billingAddress.City = "Istanbul";
            billingAddress.Country = "Turkey";
            billingAddress.Description = "Nidakule Göztepe, Merdivenköy Mah. Bora Sok. No:1";
            billingAddress.ZipCode = "34742";
            request.BillingAddress = billingAddress;

            List<BasketItem> basketItems = new List<BasketItem>();
            foreach (var item in model.CartModel.CartItems)
            {
                BasketItem firstBasketItem = new BasketItem();
                firstBasketItem.Id = item.ProductId.ToString();
                firstBasketItem.Name = item.Title;
                firstBasketItem.Category1 = "Meyve";
                firstBasketItem.ItemType = BasketItemType.PHYSICAL.ToString();
                firstBasketItem.Price = (item.Price * item.Quantity).ToString();
                basketItems.Add(firstBasketItem);
            }



            request.BasketItems = basketItems;

            return Payment.Create(request, options);

          
        }

        private void SaveOrder(OrderModel model, Payment payment, string userId)
        {
            var order = new Order();
            order.OrderNumber = new Random().Next(11111, 99999).ToString();
            order.OrderState = EnumOrderState.Completed;
            order.PaymentType = EnumPaymentType.CreditCart;
            order.PaymentId = payment.PaymentId;
            order.ConversationId = payment.ConversationId;
            order.OrderDate = new DateTime();
            order.FirstName = model.FirstName;
            order.LastName = model.LastName;
            order.Email = model.Email;
            order.Phone = model.Phone;
            order.Address = model.Address;
            order.UserId = userId;
            order.OrderNote = "Zili çalma çocuk uyuyor.";
            order.City = model.City;

            foreach (var item in model.CartModel.CartItems)
            {
                var orderItem = new OrderItem()
                {
                    Price = item.Price,
                    Quantity = item.Quantity,
                    ProductId = item.ProductId                    
                };

                order.OrderItems.Add(orderItem);
            }

            _orderService.Create(order);
        }
    }
}


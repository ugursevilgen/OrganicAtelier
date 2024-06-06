using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using OrganicAtelier.BLL.Abstract;
using OrganicAtelier.Entity;
using OrganicAtelier.WEBUI.Identity;

namespace OrganicAtelier.WEBUI.Controllers
{
    [Authorize]
    public class CartController : Controller
    {
        private readonly ICartService _cartService;
        private readonly UserManager<ApplicationUser> _userManager;

        public CartController(ICartService cartService,UserManager<ApplicationUser> userManager)
        {
            _cartService = cartService;
            _userManager = userManager;
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
    }
}

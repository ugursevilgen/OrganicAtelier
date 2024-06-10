using OrganicAtelier.BLL.Abstract;
using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.BLL.Concrete
{
    public class CartManager : ICartService
    {
        private readonly ICartDal _cartDal;

        public CartManager(ICartDal cartDal)
        {
            _cartDal = cartDal;
        }

        public void AddToCart(string userId, int productId, int quantity)
        {
            var cart = GetCartUserId(userId);
            if (cart != null)
            {
                var index = cart.CartItems.FindIndex(i => i.ProductId == productId);

                if (index < 0)
                {
                    cart.CartItems.Add(new CartItem()
                    {
                        ProductId = productId,
                        Quantity = quantity,
                        CartId = cart.Id
                    });
                }
                else
                {
                    cart.CartItems[index].Quantity += quantity;
                }

                UpdateCart(cart);
            }
        }

        public void ClearCart(int cartId)
        {
            _cartDal.ClearCart(cartId);
        }

        public void Delete(CartItem entity)
        {
            _cartDal.Delete(entity);
        }

        public Cart GetCartUserId(string userId)
        {
            return _cartDal.GetCartUserId(userId);
        }

        public CartItem GetProductByCart(int productId, int cartId)
        {
            return _cartDal.GetProductByCart(productId, cartId);
        }

        public void InitializeCart(string userId)
        {
            _cartDal.Create(new Cart() { UserId = userId });
        }

        public void Update(CartItem entity)
        {
            _cartDal.Update(entity);
        }

        public void UpdateCart(Cart entity)
        {
            _cartDal.UpdateCart(entity);
        }
    }
}

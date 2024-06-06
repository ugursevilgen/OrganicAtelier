using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.BLL.Abstract
{
    public interface ICartService
    {
        void InitializeCart(string userId);

        Cart GetCartUserId(string userId);

        CartItem GetProductByCart(int productId, int cartId);

        void AddToCart(string userId, int productId, int quantity);

        void UpdateCart(Cart entity);

        void Update(CartItem entity);
        void Delete(CartItem entity);
    }
}

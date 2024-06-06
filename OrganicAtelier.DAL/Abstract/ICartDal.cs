using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Abstract
{
    public interface ICartDal
    {
        void Create(Cart entity);

        Cart GetCartUserId(string userId);
        CartItem GetProductByCart(int productId,int cartId);
        void Update(CartItem entity);
        void Delete(CartItem entity);
        void UpdateCart(Cart entity);
    }
}

using Microsoft.EntityFrameworkCore;
using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    public class EfCoreCartDal : ICartDal
    {
        public void Create(Cart entity)
        {
           using(var context = new DataContext())
            {
                context.Carts.Add(entity);
                context.SaveChanges();
            }
        }

        public Cart GetCartUserId(string userId)
        {
            using (var context = new DataContext())
            {
               return context.Carts.
                    Include(i => i.CartItems)
                    .ThenInclude(i => i.Product)
                    .FirstOrDefault(i => i.UserId == userId);
            }
        }

        public CartItem GetProductByCart(int productId, int cartId)
        {
            using (var context = new DataContext())
            {
                return context.CartItem.Include("Product").FirstOrDefault(i => i.CartId == cartId && i.ProductId == productId);
            }
        }

        public void Update(CartItem entity)
        {
            using (var context = new DataContext())
            {
                context.Entry(entity).State = EntityState.Modified;
                context.SaveChanges();
            }
        }
        public void Delete(CartItem entity)
        {
            using (var context = new DataContext())
            {
                context.CartItem.Remove(entity);
                context.SaveChanges();
            }
        }

        public void UpdateCart(Cart entity)
        {
            using (var context = new DataContext())
            {
                context.Carts.Update(entity);
                context.SaveChanges();
            }
        }
    }
}

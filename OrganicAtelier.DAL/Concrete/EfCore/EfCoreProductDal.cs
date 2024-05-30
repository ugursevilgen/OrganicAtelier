using Microsoft.EntityFrameworkCore;
using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    public class EfCoreProductDal:EfCoreGenericRepository<Product, DataContext>, IProductDal
    {
        public override List<Product> GetAll(Expression<Func<Product, bool>> filter)
        {
            using (var context = new DataContext())
            {
                var products = context.Products.Include(i => i.ProductType).AsQueryable();

                return filter != null
                    ? products.Where(filter).ToList()
                    : products.ToList();
            }
        }

        public List<Product> GetPopularAll()
        {
            using (var context = new DataContext())
            {
                return context.Products.Where(i => i.IsPopular == true && i.Status == true).ToList();
            }
        }

       
    }

}


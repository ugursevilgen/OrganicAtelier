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
    public class EfCoreProductTypeDal : EfCoreGenericRepository<ProductType, DataContext>, IProductTypeDal
    {

        public override List<ProductType> GetAll(Expression<Func<ProductType, bool>> filter)
        {
            using (var context = new DataContext())
            {
                var productTypes = context.ProductTypes.Include(i => i.Products).AsNoTracking().AsQueryable();
                //var productTypes = context.ProductTypes.Include("Products").ToList();

                if (filter != null)
                    productTypes = productTypes.Where(filter);

                return productTypes.ToList();
            }
        }
    }
}

using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    public class EfCoreOrderDal : IOrderDal
    {
        public void Create(Order entity)
        {
            using(var context = new DataContext()) 
            {
                context.Orders.Add(entity);
                context.SaveChanges();
            }
        }
    }
}

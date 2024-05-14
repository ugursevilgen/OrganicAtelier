﻿using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    public class EfCoreProductDal:EfCoreGenericRepository<Product, DataContext>, IProductDal
    {
        public List<Product> GetPopularAll()
        {
            using (var context = new DataContext())
            {
                return context.Products.Where(i => i.IsPopular == true && i.Status == true).ToList();
            }
        }
    }

}


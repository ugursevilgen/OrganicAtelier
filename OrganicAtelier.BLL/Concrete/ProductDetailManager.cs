﻿using OrganicAtelier.BLL.Abstract;
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
    public class ProductDetailManager : IProductDetailService
    {
        private readonly IProductDetailDal _productDetailDal;

        public ProductDetailManager(IProductDetailDal productDetailDal)
        {
            _productDetailDal = productDetailDal;
        }

        public void Create(ProductDetail entity)
        {
            _productDetailDal.Create(entity);
        }

        public void Delete(ProductDetail entity)
        {
            _productDetailDal.Delete(entity);
        }

        public List<ProductDetail> GetAll(Expression<Func<ProductDetail, bool>> filter)
        {
            return _productDetailDal.GetAll(filter);
        }

        public ProductDetail GetById(int id)
        {
            return _productDetailDal.GetById(id);
        }

        public ProductDetail GetOne(Expression<Func<ProductDetail, bool>> filter = null)
        {
            return _productDetailDal.GetOne(filter);
        }
             

        public void Update(ProductDetail entity)
        {
            _productDetailDal.Update(entity);
        }
    }
}

﻿using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.BLL.Abstract
{
    public interface ISliderService
    {
        List<Slider> GetAll(Expression<Func<Slider, bool>> filter = null);
        Slider GetOne(Expression<Func<Slider, bool>> filter = null);
        Slider GetById(int id);

        void Update(Slider entity);
        void Create(Slider entity);
        void Delete(Slider entity);
    }
}

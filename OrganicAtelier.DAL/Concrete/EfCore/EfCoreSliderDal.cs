﻿using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    public class EfCoreSliderDal : ISliderDal
    {
        public List<Slider> GetAll()
        {
            using (var context = new DataContext())
            {
                return context.Sliders.ToList();
            }
        }
    }
}
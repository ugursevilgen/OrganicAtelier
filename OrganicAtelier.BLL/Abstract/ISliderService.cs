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
        Slider GetAll(Expression<Func<Slider, bool>> filter = null);
    }
}

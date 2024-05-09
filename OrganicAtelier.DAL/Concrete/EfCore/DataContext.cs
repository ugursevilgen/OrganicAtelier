using Microsoft.EntityFrameworkCore;
using OrganicAtelier.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace OrganicAtelier.DAL.Concrete.EfCore
{
    internal class DataContext:DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer("Server=UGURSEVILGEN\\SQLEXPRESS; Database=OrganicAtelier; Integrated Security=true; TrustServerCertificate=True;");
        }

        public DbSet<Product> Products { get; set; }
        public DbSet<ProductType> ProductTypes { get; set; }
        public DbSet<ProductDetail> ProductDetail { get; set; }
        public DbSet<Slider> Sliders { get; set; }
    }
}

using OrganicAtelier.BLL.Abstract;
using OrganicAtelier.BLL.Concrete;
using OrganicAtelier.DAL.Abstract;
using OrganicAtelier.DAL.Concrete.EfCore;
using OrganicAtelier.WEBUI.Mapping;

namespace OrganicAtelier.WEBUI
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllersWithViews();
            builder.Services.AddAutoMapper(typeof(MapProfile));


            builder.Services.AddScoped<IProductService, ProductManager>();
            builder.Services.AddScoped<IProductDal, EfCoreProductDal>();

            builder.Services.AddScoped<IProductTypeService, ProductTypeManager>();
            builder.Services.AddScoped<IProductTypeDal, EfCoreProductTypeDal>();

            builder.Services.AddScoped<ISliderService, SliderManager>();
            builder.Services.AddScoped<ISliderDal, EfCoreSliderDal>();

            builder.Services.AddScoped<IAboutService, AboutManager>();
            builder.Services.AddScoped<IAboutDal, EfCoreAboutDal>();

            builder.Services.AddScoped<IClientService, ClientManager>();
            builder.Services.AddScoped<IClientDal, EfCoreClientDal>();

            builder.Services.AddScoped<IFeatureService, FeatureManager>();
            builder.Services.AddScoped<IFeatureDal, EfCoreFeatureDal>();

            builder.Services.AddScoped<IBlogService, BlogManager>();
            builder.Services.AddScoped<IBlogDal, EfCoreBlogDal>();

            builder.Services.AddScoped<IContactService, ContactManager>();
            builder.Services.AddScoped<IContactDal, EfCoreContactDal>();


            var app = builder.Build();



            // Configure the HTTP request pipeline.
            if (!app.Environment.IsDevelopment())
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.MapControllerRoute(
                name: "default",
                pattern: "{controller=Admin}/{action=Index}/{id?}");

            app.Run();
        }
    }
}

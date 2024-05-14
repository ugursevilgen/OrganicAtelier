using OrganicAtelier.Entity;

namespace OrganicAtelier.DAL.Abstract
{
    public interface IProductDal : IRepository <Product>
    {
        List<Product> GetPopularAll();
    }
}
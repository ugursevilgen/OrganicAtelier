using OrganicAtelier.Entity;

namespace OrganicAtelier.DAL.Abstract
{
    public interface IProductDal
    {
        List<Product> GetAll();
        Product GetById(int id);

        void Create(Product entity);
        void Update(Product entity);
        void Delete(Product entity);

    }
}
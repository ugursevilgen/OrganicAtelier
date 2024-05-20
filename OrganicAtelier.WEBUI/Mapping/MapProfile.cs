using AutoMapper;
using OrganicAtelier.BLL.DTOs.AboutDTO;
using OrganicAtelier.BLL.DTOs.BlogDTO;
using OrganicAtelier.BLL.DTOs.ClientDTO;
using OrganicAtelier.BLL.DTOs.ContactDTO;
using OrganicAtelier.BLL.DTOs.FeatureDTO;
using OrganicAtelier.BLL.DTOs.ProductDTO;
using OrganicAtelier.BLL.DTOs.ProductTypeDTO;
using OrganicAtelier.BLL.DTOs.SliderDTO;
using OrganicAtelier.Entity;

namespace OrganicAtelier.WEBUI.Mapping
{
    public class MapProfile:Profile
    {
        public MapProfile()
        {
            CreateMap<Product, ResultProductDTO>().ReverseMap();
            CreateMap<ProductType, ResultProductTypeDTO>().ReverseMap();
            CreateMap<Slider, ResultSliderDTO>().ReverseMap();
            CreateMap<About, ResultAboutDTO>().ReverseMap();
            CreateMap<Client, ResultClientDTO>().ReverseMap();
            CreateMap<Feature, ResultFeatureDTO>().ReverseMap();
            CreateMap<Blog, ResultBlogDTO>().ReverseMap();
            CreateMap<Contact, ResultContactDTO>().ReverseMap();


        }
    }
}

using AutoMapper;
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
        }
    }
}

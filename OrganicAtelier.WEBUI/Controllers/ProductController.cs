using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using OrganicAtelier.BLL.Abstract;
using OrganicAtelier.BLL.DTOs.ProductDTO;

namespace OrganicAtelier.WEBUI.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly IProductTypeService _productTypeService;
        private readonly IMapper _mapper;

        public ProductController(IProductService productService, IProductTypeService productTypeService, IMapper mapper)
        {
            _productService = productService;
            _productTypeService = productTypeService;
            _mapper = mapper;
        }

        public IActionResult Index()
        {
            return View(_mapper.Map<List<ResultProductDTO>>(_productService.GetAll()));
        }
    }
}

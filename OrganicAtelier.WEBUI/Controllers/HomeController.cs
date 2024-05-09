using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.Controllers
{
    public class HomeController : Controller
    {
     
        public IActionResult Index()
        {
            return View();
        }

      
    }
}

using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.Controllers
{
    public class HomeController : Controller
    {
     
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult About()
        {
            return View();
        }

        public IActionResult Product()
        {
            return View();
        }

        public IActionResult Contact()
        {
            return View();
        }

    }
}

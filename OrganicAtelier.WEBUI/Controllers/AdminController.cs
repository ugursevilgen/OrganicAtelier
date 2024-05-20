using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.Controllers
{
    public class AdminController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}

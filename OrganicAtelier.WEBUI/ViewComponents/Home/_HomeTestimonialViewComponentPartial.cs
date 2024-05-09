using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.ViewComponents.Home
{
    public class _HomeTestimonialViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
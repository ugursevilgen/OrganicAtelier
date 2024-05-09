using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.ViewComponents.Home
{
    public class _HomeCarouselViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}

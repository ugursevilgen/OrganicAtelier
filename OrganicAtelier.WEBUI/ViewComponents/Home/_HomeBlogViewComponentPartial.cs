using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.ViewComponents.Home
{
    public class _HomeBlogViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
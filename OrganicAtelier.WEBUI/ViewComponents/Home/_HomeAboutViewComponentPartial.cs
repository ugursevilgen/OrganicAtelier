using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.ViewComponents.Home
{
    public class _HomeAboutViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}

using Microsoft.AspNetCore.Mvc;

namespace OrganicAtelier.WEBUI.ViewComponents.Home
{
    public class _HomeProductViewComponentPartial : ViewComponent
    {
        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}

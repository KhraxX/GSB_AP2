using Microsoft.AspNetCore.Mvc;

namespace ASPBookProject.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

    }
}

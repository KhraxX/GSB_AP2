using Microsoft.AspNetCore.Mvc;

namespace ASPBookProject.Controllers
{
    public class Medicament : Controller
    {
        // GET: Medicament
        public ActionResult Index()
        {
            return View(Index);
        }

    }
}

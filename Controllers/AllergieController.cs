using ASPBookProject.Data;
using ASPBookProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ASPBookProject.Controllers
{
    public class AllergieController : Controller
    {
        private readonly ApplicationDbContext _context;
        // GET: AllergieController
         [Authorize]
        public ActionResult Index()
        {

            
            List<Allergie> allergies = new List<Allergie>();
            allergies = _context.Allergies.ToList();
            return View(allergies);
        }

    }
}

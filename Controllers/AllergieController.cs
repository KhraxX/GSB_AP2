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

          public AllergieController(ApplicationDbContext context)
        {
            _context = context;
        }
         [Authorize]
        public ActionResult Index()
        {
            List<Allergie> allergies = new List<Allergie>();
            allergies = _context.Allergies.ToList();
            return View(allergies);
        }
        [Authorize]
        public async Task<IActionResult> Delete(int id)
        {
            var allergie = await _context.Allergies.FirstOrDefaultAsync(a => a.AllergieId == id);
            if (allergie == null)
                return NotFound();

            return View(allergie);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmed(int AllergieId)
        {
            var allergie = await _context.Allergies.FirstOrDefaultAsync(a => a.AllergieId == AllergieId);
            if (allergie == null)
                return NotFound();


            _context.Allergies.Remove(allergie);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [Authorize]
        public async Task<IActionResult> Edit(int id)
        {
            var allergie = await _context.Allergies.Include(a => a.Medicaments).FirstOrDefaultAsync(a => a.AllergieId == id);
            if (allergie == null)
                return NotFound();

            return View(allergie);
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Allergie allergie)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            Allergie? aller = await _context.Allergies.FirstOrDefaultAsync(all => all.AllergieId == allergie.AllergieId);
            if (aller != null)
            {
                aller.Libelle_al = allergie.Libelle_al;

                _context.SaveChanges();
                return RedirectToAction("Index");
            }
            return NotFound();

        }
        [Authorize]
        public IActionResult Add()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Add(Allergie allergie)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            _context.Allergies.Add(allergie);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}

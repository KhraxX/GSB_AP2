using ASPBookProject.Data;
using ASPBookProject.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ASPBookProject.Controllers
{
    public class AntecedentController : Controller
    {
        private readonly ApplicationDbContext _context;

          public AntecedentController(ApplicationDbContext context)
        {
            _context = context;
        }

         [Authorize]
        public ActionResult Index()
        {
            List<Antecedent> antecedent = new List<Antecedent>();
            antecedent = _context.Antecedents.ToList();
            return View(antecedent);
        }

        [Authorize]
        public async Task<IActionResult> Delete(int id)
        {
            var antecedent = await _context.Antecedents.FirstOrDefaultAsync(a => a.AntecedentId == id);
            if (antecedent == null)
                return NotFound();

            return View(antecedent);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteConfirmed(int AntecedentId)
        {
            var antecedent = await _context.Antecedents.FirstOrDefaultAsync(a => a.AntecedentId == AntecedentId);
            if (antecedent == null)
                return NotFound();


            _context.Antecedents.Remove(antecedent);
            _context.SaveChanges();

            return RedirectToAction("Index");
        }

        [Authorize]
        public async Task<IActionResult> Edit(int id)
        {
            var antecedent = await _context.Antecedents.Include(a => a.Medicaments).FirstOrDefaultAsync(a => a.AntecedentId == id);
            if (antecedent == null)
                return NotFound();

            return View(antecedent);
        }

        [HttpPost, ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(Antecedent antecedent)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            Antecedent? aller = await _context.Antecedents.FirstOrDefaultAsync(all => all.AntecedentId == antecedent.AntecedentId);
            if (aller != null)
            {
                aller.Libelle_a = antecedent.Libelle_a;

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
        public IActionResult Add(Antecedent antecedent)
        {
            if (!ModelState.IsValid)
            {
                return View();
            }

            _context.Antecedents.Add(antecedent);
            _context.SaveChanges();
            return RedirectToAction("Index");
        }

    }
}

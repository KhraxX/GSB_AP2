using ASPBookProject.Models;
using ASPBookProject.Services;
using Microsoft.AspNetCore.Mvc;

namespace ASPBookProject.Controllers
{
    public class ContactController : Controller
    {
        private readonly IEmailService _emailService;

        public ContactController(IEmailService emailService)
        {
            _emailService = emailService ?? throw new ArgumentNullException(nameof(emailService));
        }

        public IActionResult Index()
        {
            return View(new ContactForm()); 
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Index(ContactForm model)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await _emailService.SendEmailAsync(model);
                    TempData["SuccessMessage"] = "Votre message a été envoyé avec succès !";
                    return RedirectToAction(nameof(Index));
                }
                catch (Exception ex)
                {
                    ModelState.AddModelError("", "Une erreur est survenue lors de l'envoi du message. Veuillez réessayer plus tard.");
                    return View(model);
                }
            }
            return View(model);
        }
    }
}

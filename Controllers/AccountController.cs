using ASPBookProject.Models;
using ASPBookProject.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

public class AccountController : Controller
{
    
    private readonly SignInManager<Medecin> _signInManager; // permet de gerer la connexion et la deconnexion des utilisateurs, nous est fourni par ASP.NET Core Identity
    private readonly UserManager<Medecin> _userManager;

    public AccountController(SignInManager<Medecin> signInManager, UserManager<Medecin> userManager)
    {
        _signInManager = signInManager;
        _userManager = userManager;
    }

    public IActionResult Login()
    {
        return View(); // Affiche la vue Login
    }

 [HttpPost]
public async Task<IActionResult> Login(LoginViewModel model)
{
    if (ModelState.IsValid)
    {
        var result = await _signInManager.PasswordSignInAsync(model.UserName, model.Password, model.RememberMe, false);

        if (result.Succeeded)
        {
            return RedirectToAction("Index", "Patient");
        }

        ModelState.AddModelError(string.Empty, "Invalid login attempt.");
    }

    return View(model);
}
    public async Task<IActionResult> Logout()
    {
        await _signInManager.SignOutAsync();

        return View();
    }

   
    public IActionResult Register()
{

    return View();
}

[HttpPost]
public async Task<IActionResult> Register(RegisterViewModel model)
{
    if (ModelState.IsValid)
    {
        var medecin = new Medecin{
            UserName = model.UserName,
            Login_m = model.Login_m,
            Role = model.Role,
            Date_naissance_m = model.Date,
        };
        var result = await _userManager.CreateAsync(medecin, model.Password);

        if (result.Succeeded)
        {
            await _signInManager.SignInAsync(medecin, isPersistent: false);
            return RedirectToAction("Index", "Patient");
        }

        foreach (var error in result.Errors)
        {
            ModelState.AddModelError(string.Empty, error.Description);
        }
    }

    return View(model);
}
}
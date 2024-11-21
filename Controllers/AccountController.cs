using ASPBookProject.Models;
using ASPBookProject.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

public class AccountController : Controller
{

    private readonly SignInManager<Medecin> _signInManager;
    private readonly UserManager<Medecin> _userManager;

    public AccountController(SignInManager<Medecin> signInManager, UserManager<Medecin> userManager)
    {
        _signInManager = signInManager;
        _userManager = userManager;
    }

    public IActionResult Login()
    {
        return View(); 
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
            var medecin = new Medecin
            {
                UserName = model.UserName,
                
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
    [Authorize]
public async Task<IActionResult> Edit()
{
    var user = await _userManager.GetUserAsync(User);
    if (user == null)
    {
        return NotFound();
    }

    var model = new EditMedecinViewModel
    {
        UserName = user.UserName,
        
    };

    return View(model);
}

[Authorize]
[HttpPost]
[ValidateAntiForgeryToken]
public async Task<IActionResult> Edit(EditMedecinViewModel model)
{
    if (ModelState.IsValid)
    {
        var user = await _userManager.GetUserAsync(User);
        if (user == null)
        {
            return NotFound();
        }

        var validPassword = await _userManager.CheckPasswordAsync(user, model.CurrentPassword);
        if (!validPassword)
        {
            ModelState.AddModelError(string.Empty, "Mot de passe actuel incorrect");
            return View(model);
        }

        user.UserName = model.UserName;
        

        var result = await _userManager.UpdateAsync(user);

        if (!string.IsNullOrEmpty(model.NewPassword))
        {
            var changePasswordResult = await _userManager.ChangePasswordAsync(user, 
                model.CurrentPassword, model.NewPassword);
            if (!changePasswordResult.Succeeded)
            {
                foreach (var error in changePasswordResult.Errors)
                {
                    ModelState.AddModelError(string.Empty, error.Description);
                }
                return View(model);
            }
        }

        if (result.Succeeded)
        {
            await _signInManager.RefreshSignInAsync(user);
            TempData["SuccessMessage"] = "Votre profil a été mis à jour avec succès.";
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
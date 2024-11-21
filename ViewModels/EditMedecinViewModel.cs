using System;
using System.ComponentModel.DataAnnotations;

namespace ASPBookProject.ViewModels;

public class EditMedecinViewModel
{
    [Required(ErrorMessage = "Le nom d'utilisateur est requis")]
    [Display(Name = "Nom d'utilisateur")]
    public string UserName { get; set; }

    

    [Required(ErrorMessage = "Le mot de passe actuel est requis")]
    [DataType(DataType.Password)]
    [Display(Name = "Mot de passe actuel")]
    public string CurrentPassword { get; set; }

    [DataType(DataType.Password)]
    [Display(Name = "Nouveau mot de passe")]
    public string NewPassword { get; set; }
}

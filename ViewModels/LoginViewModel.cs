using System;
using System.ComponentModel.DataAnnotations;

namespace ASPBookProject.ViewModels;

public class LoginViewModel
{
   
    [Required(ErrorMessage = "The Username field is required.")]
    public required string UserName { get; set; }

    [Required]
    [DataType(DataType.Password)]
    public required string Password { get; set; }

    [Display(Name = "Remember me?")]
    public bool RememberMe { get; set; }
}

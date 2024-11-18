using System;
using System.ComponentModel.DataAnnotations;

namespace ASPBookProject.Models
{
    public class ContactForm
    {
        [Required(ErrorMessage = "Le nom est requis")]
        [Display(Name = "Nom")]
        [StringLength(50, MinimumLength = 2, ErrorMessage = "Le nom doit contenir entre 2 et 50 caractères")]
        public string Name { get; set; } = string.Empty;

        [Required(ErrorMessage = "L'email est requis")]
        [EmailAddress(ErrorMessage = "Email invalide")]
        [Display(Name = "Email")]
        [StringLength(100, ErrorMessage = "L'email ne peut pas dépasser 100 caractères")]
        public string Email { get; set; } = string.Empty;

        [Required(ErrorMessage = "Le sujet est requis")]
        [Display(Name = "Sujet")]
        [StringLength(100, MinimumLength = 3, ErrorMessage = "Le sujet doit contenir entre 3 et 100 caractères")]
        public string Subject { get; set; } = string.Empty;

        [Required(ErrorMessage = "Le message est requis")]
        [Display(Name = "Message")]
        [MinLength(10, ErrorMessage = "Le message doit contenir au moins 10 caractères")]
        [MaxLength(1000, ErrorMessage = "Le message ne peut pas dépasser 1000 caractères")]
        public string Message { get; set; } = string.Empty;
    }
}

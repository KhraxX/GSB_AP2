using System;
using System.ComponentModel.DataAnnotations;

namespace ASPBookProject.Models;

public class Patient
{
    [Key]
    
    public int PatientId { get; set; }
    public required string Nom_p { get; set; }
    public required string Prenom_p { get; set; }
    public required string Sexe_p { get; set; }
    public required string Num_secu { get; set; } // Ici un string car un int ne peut pas contenir plus de 11 chiffres
    public List<Antecedent> Antecedents { get; set; } = new();
    public List<Allergie> Allergies { get; set; } = new();
    public List<Ordonnance>? Ordonnances { get; set; }
}



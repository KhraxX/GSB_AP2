using System;
using System.ComponentModel.DataAnnotations;

namespace ASPBookProject.Models;

public class Ordonnance
{
    public int OrdonnanceId { get; set; }
    public required string Posologie { get; set; }

    [DataType(DataType.Date)]
    public required DateTime Date_Debut { get; set; }

    [DataType(DataType.Date)]
    public required DateTime Date_Fin { get; set; }
    public string? Instructions_specifique { get; set; }

    public required string MedecinId { get; set; }
    public Medecin Medecin { get; set; }
    public required int  PatientId { get; set; }
    public Patient Patient { get; set; }
    public List<Medicament> Medicaments { get; set; } = new();
}
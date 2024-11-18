using ASPBookProject.Models;
using Microsoft.AspNetCore.Mvc;

namespace ASPBookProject.Controllers
{
    public class FAQController : Controller
{
    private static readonly List<FAQ> _faqs = new()
    {
        new FAQ 
        { 
            Id = 1,
            Question = "Comment créer une ordonnance ?",
            Answer = "Pour créer une ordonnance, accédez à l'onglet 'Ordonnances' puis cliquez sur le bouton 'Créer une ordonnance'. Sélectionnez ensuite le patient concerné et ajoutez les médicaments nécessaires."
        },
        new FAQ 
        { 
            Id = 2,
            Question = "Comment gérer les allergies d'un patient ?",
            Answer = "Les allergies d'un patient peuvent être gérées depuis sa fiche patient. Dans l'onglet 'Patients', sélectionnez le patient concerné puis utilisez la section 'Allergies' pour ajouter ou retirer des allergies."
        },
        new FAQ 
        { 
            Id = 3,
            Question = "Comment modifier un médicament ?",
            Answer = "Pour modifier un médicament, allez dans l'onglet 'Médicaments', trouvez le médicament concerné et cliquez sur le bouton 'Modifier'. Vous pourrez alors mettre à jour ses informations et ses contre-indications."
        },
        // Suggestions de questions supplémentaires
        new FAQ 
        { 
            Id = 4,
            Question = "Comment rechercher un patient ?",
            Answer = "Utilisez la barre de recherche dans la section 'Patients' pour trouver rapidement un patient par son nom ou son numéro de sécurité sociale."
        },
        new FAQ 
        { 
            Id = 5,
            Question = "Comment gérer les antécédents d'un patient ?",
            Answer = "Dans la fiche du patient, section 'Antécédents', vous pouvez ajouter ou modifier les antécédents médicaux du patient."
        }
    };

    public IActionResult Index()
    {
        return View(_faqs);
    }
}
}

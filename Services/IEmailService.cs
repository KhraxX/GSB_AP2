using ASPBookProject.Models;
using System.Threading.Tasks;

namespace ASPBookProject.Services
{

    public interface IEmailService
    {
        Task SendEmailAsync(ContactForm contactForm);
    }
}
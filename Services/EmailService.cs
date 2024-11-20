using ASPBookProject.Models;
using Microsoft.Extensions.Configuration;
using System;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace ASPBookProject.Services
{
    public class EmailService : IEmailService
    {
        private readonly IConfiguration _configuration;
        private readonly string _smtpServer;
        private readonly int _smtpPort;
        private readonly string _smtpUsername;
        private readonly string _smtpPassword;
        private readonly string _toEmail;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration ?? throw new ArgumentNullException(nameof(configuration));
            
            _smtpServer = _configuration["EmailSettings:SmtpServer"] 
                ?? throw new InvalidOperationException("SMTP server configuration is missing");
            
            if (!int.TryParse(_configuration["EmailSettings:SmtpPort"], out _smtpPort))
            {
                throw new InvalidOperationException("Invalid SMTP port configuration");
            }
            
            _smtpUsername = _configuration["EmailSettings:SmtpUsername"] 
                ?? throw new InvalidOperationException("SMTP username configuration is missing");
            _smtpPassword = _configuration["EmailSettings:SmtpPassword"] 
                ?? throw new InvalidOperationException("SMTP password configuration is missing");
            _toEmail = _configuration["EmailSettings:ToEmail"] 
                ?? throw new InvalidOperationException("Recipient email configuration is missing");
        }

        public async Task SendEmailAsync(ContactForm contactForm)
        {
            if (contactForm == null)
            {
                throw new ArgumentNullException(nameof(contactForm));
            }

            try
            {
                using var client = new SmtpClient(_smtpServer, _smtpPort)
                {
                    UseDefaultCredentials = false,
                    EnableSsl = true,
                    Credentials = new NetworkCredential(_smtpUsername, _smtpPassword)
                };

                var emailBody = BuildEmailBody(contactForm);
                var message = BuildEmailMessage(contactForm, emailBody);

                await client.SendMailAsync(message);
            }
            catch (SmtpException ex)
            {
                throw new Exception($"Erreur SMTP lors de l'envoi de l'email : {ex.Message}", ex);
            }
            catch (Exception ex)
            {
                throw new Exception($"Erreur inattendue lors de l'envoi de l'email : {ex.Message}", ex);
            }
        }

        private static string BuildEmailBody(ContactForm contactForm)
        {
            return $@"
                <html>
                <head>
                    <style>
                        body {{ font-family: Arial, sans-serif; }}
                        .container {{ padding: 20px; }}
                        .header {{ color: #2563eb; }}
                        .field {{ margin: 10px 0; }}
                        .label {{ font-weight: bold; }}
                    </style>
                </head>
                <body>
                    <div class='container'>
                        <h2 class='header'>Nouveau message de contact</h2>
                        <div class='field'>
                            <span class='label'>De:</span> {WebUtility.HtmlEncode(contactForm.Name)}
                        </div>
                        <div class='field'>
                            <span class='label'>Email:</span> {WebUtility.HtmlEncode(contactForm.Email)}
                        </div>
                        <div class='field'>
                            <span class='label'>Sujet:</span> {WebUtility.HtmlEncode(contactForm.Subject)}
                        </div>
                        <div class='field'>
                            <h3>Message:</h3>
                            <p>{WebUtility.HtmlEncode(contactForm.Message).Replace(Environment.NewLine, "<br/>")}</p>
                        </div>
                    </div>
                </body>
                </html>
            ";
        }

        private MailMessage BuildEmailMessage(ContactForm contactForm, string emailBody)
        {
            var message = new MailMessage
            {
                From = new MailAddress(contactForm.Email, contactForm.Name),
                Subject = $"Nouveau message de contact - {contactForm.Subject}",
                Body = emailBody,
                IsBodyHtml = true
            };

            message.To.Add(_toEmail);
            message.ReplyToList.Add(new MailAddress(contactForm.Email));

            return message;
        }
    }
}
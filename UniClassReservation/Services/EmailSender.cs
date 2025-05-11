using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity.UI.Services;
using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;

namespace UniClassReservation.Services
{
    public class EmailSender : IEmailSender
    {
        private readonly IConfiguration _configuration;

        public EmailSender(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
            var emailSettings = _configuration.GetSection("EmailSettings");
            var message = new MimeMessage();
            message.From.Add(new MailboxAddress("UniClass Reservation", emailSettings["From"]));
            message.To.Add(new MailboxAddress("", email));
            message.Subject = subject;

            var bodyBuilder = new BodyBuilder
            {
                HtmlBody = htmlMessage
            };
            message.Body = bodyBuilder.ToMessageBody();

            using (var client = new SmtpClient())
            {
                await client.ConnectAsync(
                    emailSettings["SmtpServer"],
                    int.Parse(emailSettings["Port"]),
                    SecureSocketOptions.StartTls
                );

                await client.AuthenticateAsync(
                    emailSettings["Username"],
                    emailSettings["Password"]
                );

                await client.SendAsync(message);
                await client.DisconnectAsync(true);
            }
        }
    }
} 
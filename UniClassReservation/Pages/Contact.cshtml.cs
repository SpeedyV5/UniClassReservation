using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;
using System.Net;
using System.Net.Mail;

namespace UniClassReservation.Pages
{
    public class ContactModel : PageModel
    {
        [BindProperty]
        public ContactFormModel ContactForm { get; set; }

        public void OnGet()
        {
        }

        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            // SMTP ayarları
            var smtpHost = "smtp.gmail.com";
            var smtpPort = 587;
            var smtpUser = "ersanozdemir0715@gmail.com"; // Gönderen adres (veya uygulama şifresiyle açılmış bir hesap)
            var smtpPass = "tqno psky gzzi lxwy"; // Gmail uygulama şifresi kullanılmalı

            var toAddress = "ersanozdemir07@hotmail.com";
            var fromAddress = smtpUser;
            var subject = $"[Support] {ContactForm.Subject} - {ContactForm.Name}";
            var body = $"Name: {ContactForm.Name}\nEmail: {ContactForm.Email}\nSubject: {ContactForm.Subject}\nMessage:\n{ContactForm.Message}";

            try
            {
                using (var client = new SmtpClient(smtpHost, smtpPort))
                {
                    client.EnableSsl = true;
                    client.Credentials = new NetworkCredential(smtpUser, smtpPass);

                    var mail = new MailMessage(fromAddress, toAddress, subject, body);
                    mail.ReplyToList.Add(new MailAddress(ContactForm.Email));
                    client.Send(mail);
                }
                TempData["SuccessMessage"] = "Your message has been sent successfully. We'll get back to you soon.";
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "There was an error sending your message. Please try again later.";
                // Hata loglama eklenebilir: ex.Message
            }
            return RedirectToPage();
        }
    }

    public class ContactFormModel
    {
        [Required(ErrorMessage = "Please enter your name")]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Please enter your email")]
        [EmailAddress(ErrorMessage = "Please enter a valid email address")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Please select a subject")]
        [Display(Name = "Subject")]
        public string Subject { get; set; }

        [Required(ErrorMessage = "Please enter your message")]
        [Display(Name = "Message")]
        public string Message { get; set; }
    }
} 
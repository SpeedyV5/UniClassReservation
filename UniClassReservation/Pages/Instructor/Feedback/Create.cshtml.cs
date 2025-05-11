using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Identity.UI.Services;
using UniClassReservation.Services;
using System.Net;
using System.Net.Mail;
using Microsoft.Extensions.Configuration;

namespace UniClassReservation.Pages.Instructor.Feedback
{
    [Authorize(Roles = "Instructor")]
    public class CreateModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;
        private readonly LogService _logService;
        public CreateModel(ApplicationDbContext context, IConfiguration configuration, LogService logService)
        {
            _context = context;
            _configuration = configuration;
            _logService = logService;
        }
        [BindProperty]
        [Required]
        [StringLength(1000, ErrorMessage = "Message can be at most 1000 characters.")]
        public string Message { get; set; }
        [BindProperty]
        [Range(1, 5, ErrorMessage = "Rating must be between 1 and 5.")]
        public int Rating { get; set; }
        [BindProperty]
        public int? ClassroomId { get; set; }
        public SelectList ClassroomList { get; set; }
        public IActionResult OnGet()
        {
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            var myClassroomIds = _context.Reservations
                .Where(r => r.UserId == userId)
                .Select(r => r.ClassroomId)
                .Distinct()
                .ToList();
            ClassroomList = new SelectList(_context.Classrooms
                .Where(c => c.IsActive && myClassroomIds.Contains(c.Id))
                .OrderBy(c => c.Name), "Id", "Name");
            return Page();
        }
        public async Task<IActionResult> OnPost()
        {
            if (!ModelState.IsValid)
            {
                var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
                var myClassroomIds = _context.Reservations
                    .Where(r => r.UserId == userId)
                    .Select(r => r.ClassroomId)
                    .Distinct()
                    .ToList();
                ClassroomList = new SelectList(_context.Classrooms
                    .Where(c => c.IsActive && myClassroomIds.Contains(c.Id))
                    .OrderBy(c => c.Name), "Id", "Name");
                return Page();
            }
            var user = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name);
            if (user == null)
                return RedirectToPage("/Index");
            var classroom = ClassroomId.HasValue ? _context.Classrooms.FirstOrDefault(c => c.Id == ClassroomId.Value) : null;
            var feedback = new UniClassReservation.Models.Feedback
            {
                UserId = user.Id,
                UserName = user.FirstName + " " + user.LastName,
                Message = Message,
                CreatedAt = DateTime.UtcNow,
                IsRead = false,
                Rating = Rating,
                ClassroomId = ClassroomId,
                ClassroomName = classroom?.Name ?? string.Empty
            };
            _context.Feedbacks.Add(feedback);
            _context.SaveChanges();
            await _logService.LogActivityAsync("Feedback Submitted", "Success", $"User: {user.UserName}, Class: {classroom?.Name}, Rating: {Rating}, Message: {Message}");
            if (classroom != null)
            {
                var classFeedbacks = _context.Feedbacks.Where(f => f.ClassroomId == classroom.Id).ToList();
                classroom.FeedbackCount = classFeedbacks.Count;
                classroom.AverageRating = classFeedbacks.Any() ? classFeedbacks.Average(f => f.Rating) : 0;
                _context.SaveChanges();
            }
            // Admin e-posta adresini bul ve e-posta gönder
            var adminEmail = "ersanozdemir0715@gmail.com";
            var subject = "New Feedback Submitted";
            var body = $"User: {feedback.UserName}<br/>Class: {feedback.ClassroomName}<br/>Rating: {feedback.Rating}<br/>Comment: {feedback.Message}";

            // SMTP ayarlarını appsettings.json'dan al
            var emailSettings = _configuration.GetSection("EmailSettings");
            var smtpHost = emailSettings["SmtpServer"];
            var smtpPort = int.Parse(emailSettings["Port"]);
            var smtpUser = emailSettings["Username"];
            var smtpPass = emailSettings["Password"];
            try
            {
                using (var client = new SmtpClient(smtpHost, smtpPort))
                {
                    client.EnableSsl = true;
                    client.Credentials = new NetworkCredential(smtpUser, smtpPass);
                    var mail = new MailMessage(smtpUser, adminEmail, subject, body);
                    mail.IsBodyHtml = true;
                    client.Send(mail);
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "There was an error sending the feedback email. Please try again later.";
            }
            TempData["Success"] = "Your feedback has been submitted successfully.";
            return RedirectToPage("/Index");
        }
        public IActionResult OnGetTestEmail()
        {
            var emailSettings = _configuration.GetSection("EmailSettings");
            var smtpHost = emailSettings["SmtpServer"];
            var smtpPort = int.Parse(emailSettings["Port"]);
            var smtpUser = emailSettings["Username"];
            var smtpPass = emailSettings["Password"];
            var toAddress = "farkliadres@gmail.com"; // Buraya kendi farklı bir adresinizi yazın
            try
            {
                using (var client = new SmtpClient(smtpHost, smtpPort))
                {
                    client.EnableSsl = true;
                    client.Credentials = new NetworkCredential(smtpUser, smtpPass);
                    var mail = new MailMessage(smtpUser, toAddress, "Test Email", "This is a test email from UniClassReservation.");
                    mail.IsBodyHtml = false;
                    client.Send(mail);
                }
                TempData["Success"] = "Test email sent successfully.";
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Test email failed: " + ex.ToString();
                System.IO.File.AppendAllText("email_error.log", ex.ToString() + "\n");
            }
            return RedirectToPage("/Index");
        }
    }
} 
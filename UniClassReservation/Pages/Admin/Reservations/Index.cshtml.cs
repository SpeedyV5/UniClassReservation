using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using UniClassReservation.Data;
using UniClassReservation.Models;
using Microsoft.AspNetCore.Identity.UI.Services;
using UniClassReservation.Services;

namespace UniClassReservation.Pages.Admin.Reservations
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        private readonly IEmailSender _emailSender;
        private readonly LogService _logService;
        public IndexModel(ApplicationDbContext context, IEmailSender emailSender, LogService logService)
        {
            _context = context;
            _emailSender = emailSender;
            _logService = logService;
        }
        public List<Reservation> Reservations { get; set; } = new();
        [BindProperty]
        public int ReservationId { get; set; }
        [BindProperty]
        public string ActionType { get; set; } = string.Empty;
        public DateTime WeekStart { get; set; }
        public List<Holiday> Holidays { get; set; } = new();
        public void OnGet(string? week)
        {
            // Haftanın başlangıcı (Pazartesi)
            DateTime weekStart;
            if (!string.IsNullOrEmpty(week) && DateTime.TryParse(week, out var parsed))
            {
                weekStart = parsed;
            }
            else
            {
                var today = DateTime.Today;
                int diff = (7 + (today.DayOfWeek - DayOfWeek.Monday)) % 7;
                weekStart = today.AddDays(-1 * diff);
            }
            WeekStart = weekStart;

            Reservations = _context.Reservations
                .Include(r => r.User)
                .Include(r => r.Classroom)
                .Include(r => r.Term)
                .Where(r => r.StartTime >= weekStart && r.StartTime < weekStart.AddDays(7))
                .OrderBy(r => r.StartTime)
                .ToList();

            Holidays = _context.Holidays.Where(h => h.IsActive && h.EndDate >= weekStart && h.StartDate <= weekStart.AddDays(6)).ToList();
        }
        public IActionResult OnPost()
        {
            var reservation = _context.Reservations.Include(r => r.User).Include(r => r.Classroom).Include(r => r.Term).FirstOrDefault(r => r.Id == ReservationId);
            if (reservation != null && reservation.Status == "Pending")
            {
                string emailSubject = "";
                string emailBody = "";
                string logStatus = "";
                if (ActionType == "approve")
                {
                    reservation.Status = "Approved";
                    emailSubject = "Your reservation has been approved";
                    emailBody = $"Hello {reservation.User?.FirstName},<br>Your reservation for class <b>{reservation.Classroom?.Name}</b> on <b>{reservation.StartTime:dd.MM.yyyy HH:mm} - {reservation.EndTime:HH:mm}</b> has been <b style='color:green;'>APPROVED</b>.";
                    // Holiday check
                    bool isHoliday = _context.Holidays.Any(h => h.IsActive && h.StartDate <= reservation.EndTime && h.EndDate >= reservation.StartTime);
                    if (isHoliday)
                    {
                        emailBody += "<br><b style='color:orange;'>Warning: This reservation falls on an official holiday!</b>";
                    }
                    logStatus = "Approved";
                }
                else if (ActionType == "reject")
                {
                    reservation.Status = "Rejected";
                    emailSubject = "Your reservation has been rejected";
                    emailBody = $"Hello {reservation.User?.FirstName},<br>Your reservation for class <b>{reservation.Classroom?.Name}</b> on <b>{reservation.StartTime:dd.MM.yyyy HH:mm} - {reservation.EndTime:HH:mm}</b> has been <b style='color:red;'>REJECTED</b>.";
                    logStatus = "Rejected";
                }
                _context.SaveChanges();
                if (!string.IsNullOrEmpty(reservation.User?.Email))
                {
                    _emailSender.SendEmailAsync(reservation.User.Email, emailSubject, emailBody).Wait();
                }
                _logService.LogActivityAsync($"Reservation {ActionType}", logStatus, $"ReservationId: {reservation.Id}, User: {reservation.User?.UserName}, Class: {reservation.Classroom?.Name}, Term: {reservation.Term?.Name}, Start: {reservation.StartTime}, End: {reservation.EndTime}").Wait();
            }
            return RedirectToPage();
        }
    }
} 
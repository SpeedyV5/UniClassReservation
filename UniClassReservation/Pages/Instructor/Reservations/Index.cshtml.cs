using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Instructor.Reservations
{
    [Authorize(Roles = "Instructor,Admin")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;

        public IndexModel(ApplicationDbContext context)
        {
            _context = context;
        }

        public IList<Reservation> Reservations { get; set; } = new List<Reservation>();
        public IList<CalendarEvent> CalendarEvents { get; set; } = new List<CalendarEvent>();
        public DateTime WeekStart { get; set; }
        public List<Holiday> Holidays { get; set; } = new();

        public async Task OnGetAsync(string? week, bool adminview = false)
        {
            // Determine week start (Monday)
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

            bool isAdmin = User.IsInRole("Admin");
            if (isAdmin || adminview)
            {
                Reservations = await _context.Reservations
                    .Include(r => r.Classroom)
                    .Include(r => r.Term)
                    .OrderByDescending(r => r.StartTime)
                    .ToListAsync();
            }
            else
            {
                var userId = User.FindFirst(System.Security.Claims.ClaimTypes.NameIdentifier)?.Value;
                if (string.IsNullOrEmpty(userId)) return;
                Reservations = await _context.Reservations
                    .Include(r => r.Classroom)
                    .Include(r => r.Term)
                    .Where(r => r.UserId == userId)
                    .OrderByDescending(r => r.StartTime)
                    .ToListAsync();
            }

            // Convert reservations to calendar events
            CalendarEvents = Reservations.Select(r => new CalendarEvent
            {
                Id = r.Id.ToString(),
                Title = $"{r.Classroom?.Name} - {r.Term?.Name}",
                Start = r.StartTime,
                End = r.EndTime,
                Color = GetStatusColor(r.Status),
                ExtendedProps = new Dictionary<string, string>
                {
                    { "status", r.Status }
                }
            }).ToList();

            // Load holidays for the current week
            var weekEnd = WeekStart.AddDays(7);
            Holidays = await _context.Holidays
                .Where(h => h.IsActive && h.StartDate < weekEnd && h.EndDate >= WeekStart)
                .ToListAsync();
        }

        private string GetStatusColor(string status)
        {
            return status switch
            {
                "Pending" => "#ffc107", // Sarı
                "Approved" => "#28a745", // Yeşil
                "Rejected" => "#dc3545", // Kırmızı
                _ => "#6c757d" // Gri
            };
        }
    }

    public class CalendarEvent
    {
        public string Id { get; set; }
        public string Title { get; set; }
        public DateTime Start { get; set; }
        public DateTime End { get; set; }
        public string Color { get; set; }
        public Dictionary<string, string> ExtendedProps { get; set; }
    }
} 
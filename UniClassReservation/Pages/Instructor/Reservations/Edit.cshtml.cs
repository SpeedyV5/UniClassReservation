using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Instructor.Reservations
{
    [Authorize(Roles = "Instructor")]
    public class EditModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public EditModel(ApplicationDbContext context)
        {
            _context = context;
        }
        [BindProperty]
        public Reservation Reservation { get; set; } = new();
        public List<SelectListItem> Terms { get; set; } = new();
        public List<SelectListItem> Classrooms { get; set; } = new();
        public IActionResult OnGet(int id)
        {
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            Reservation = _context.Reservations.FirstOrDefault(r => r.Id == id && r.UserId == userId);
            if (Reservation == null)
                return RedirectToPage("Index");
            Terms = _context.Terms.Where(t => t.IsActive)
                .OrderByDescending(t => t.StartDate)
                .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                .ToList();
            Classrooms = _context.Classrooms.Where(c => c.IsActive)
                .OrderBy(c => c.Name)
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                .ToList();
            // Haftalık rezervasyon kontrolü
            var similarReservations = _context.Reservations.Where(r =>
                r.Id != Reservation.Id &&
                r.UserId == userId &&
                r.ClassroomId == Reservation.ClassroomId &&
                r.TermId == Reservation.TermId &&
                r.StartTime.TimeOfDay == Reservation.StartTime.TimeOfDay &&
                r.EndTime.TimeOfDay == Reservation.EndTime.TimeOfDay
            ).ToList();
            if (similarReservations.Count > 0)
            {
                ViewData["WeeklyWarning"] = "This reservation is part of a weekly series. Editing this will only affect this single occurrence.";
            }
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
            {
                Terms = _context.Terms.Where(t => t.IsActive)
                    .OrderByDescending(t => t.StartDate)
                    .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                    .ToList();
                Classrooms = _context.Classrooms.Where(c => c.IsActive)
                    .OrderBy(c => c.Name)
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                    .ToList();
                return Page();
            }
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            var reservationInDb = _context.Reservations.FirstOrDefault(r => r.Id == Reservation.Id && r.UserId == userId);
            if (reservationInDb == null)
            {
                ModelState.AddModelError(string.Empty, "Reservation not found or you do not have permission to edit this reservation.");
                Terms = _context.Terms.Where(t => t.IsActive)
                    .OrderByDescending(t => t.StartDate)
                    .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                    .ToList();
                Classrooms = _context.Classrooms.Where(c => c.IsActive)
                    .OrderBy(c => c.Name)
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                    .ToList();
                return Page();
            }

            // Çakışma kontrolü: yeni saat aralığı ile, kendi kaydını hariç tutarak
            bool hasConflict = _context.Reservations.Any(r =>
                r.Id != reservationInDb.Id &&
                r.ClassroomId == Reservation.ClassroomId &&
                r.TermId == Reservation.TermId &&
                (r.Status == "Approved" || r.Status == "Pending") &&
                r.StartTime.Date == Reservation.StartTime.Date &&
                r.StartTime < Reservation.EndTime &&
                r.EndTime > Reservation.StartTime);
            if (hasConflict)
            {
                ModelState.AddModelError(string.Empty, "There is another reservation for the selected class and time interval.");
                Terms = _context.Terms.Where(t => t.IsActive)
                    .OrderByDescending(t => t.StartDate)
                    .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                    .ToList();
                Classrooms = _context.Classrooms.Where(c => c.IsActive)
                    .OrderBy(c => c.Name)
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                    .ToList();
                return Page();
            }

            // Holiday conflict check
            bool holidayConflict = _context.Holidays.Any(h =>
                h.IsActive &&
                h.StartDate <= Reservation.EndTime &&
                h.EndDate >= Reservation.StartTime);
            if (holidayConflict)
            {
                ModelState.AddModelError(string.Empty, "The selected date range overlaps with a holiday.");
                Terms = _context.Terms.Where(t => t.IsActive)
                    .OrderByDescending(t => t.StartDate)
                    .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                    .ToList();
                Classrooms = _context.Classrooms.Where(c => c.IsActive)
                    .OrderBy(c => c.Name)
                    .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                    .ToList();
                return Page();
            }

            reservationInDb.TermId = Reservation.TermId;
            reservationInDb.ClassroomId = Reservation.ClassroomId;
            reservationInDb.StartTime = Reservation.StartTime;
            reservationInDb.EndTime = Reservation.EndTime;
            reservationInDb.Status = "Pending";
            _context.SaveChanges();
            TempData["Success"] = "Reservation has been updated successfully.";
            return RedirectToPage("Index");
        }
    }
} 
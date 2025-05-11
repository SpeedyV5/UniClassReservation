using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using UniClassReservation.Services;
using System.Net.Http;
using System.Text.Json;

namespace UniClassReservation.Pages.Instructor.Reservations
{
    [Authorize(Roles = "Instructor")]
    public class CreateModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        private readonly LogService _logService;
        private readonly IReservationService _reservationService;
        public CreateModel(ApplicationDbContext context, LogService logService, IReservationService reservationService)
        {
            _context = context;
            _logService = logService;
            _reservationService = reservationService;
        }
        [BindProperty]
        public Reservation Reservation { get; set; } = new();
        [BindProperty]
        public bool RepeatWeekly { get; set; }
        public List<SelectListItem> Terms { get; set; } = new();
        public List<SelectListItem> Classrooms { get; set; } = new();
        public void OnGet()
        {
            Terms = _context.Terms.Where(t => t.IsActive)
                .OrderByDescending(t => t.StartDate)
                .Select(t => new SelectListItem { Value = t.Id.ToString(), Text = t.Name })
                .ToList();
            Classrooms = _context.Classrooms.Where(c => c.IsActive)
                .OrderBy(c => c.Name)
                .Select(c => new SelectListItem { Value = c.Id.ToString(), Text = c.Name })
                .ToList();
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
            Reservation.UserId = userId;
            Reservation.Status = "Pending";

            // --- HOLIDAY SYNC ---
            var reservationYear = Reservation.StartTime.Year;
            bool hasHolidays = _context.Holidays.Any(h => h.StartDate.Year == reservationYear);
            if (!hasHolidays)
            {
                // Fetch holidays from API and add to DB
                var url = $"https://date.nager.at/api/v3/PublicHolidays/{reservationYear}/TR";
                using var httpClient = new HttpClient();
                var response = httpClient.GetAsync(url).Result;
                if (response.IsSuccessStatusCode)
                {
                    var json = response.Content.ReadAsStringAsync().Result;
                    var holidays = JsonSerializer.Deserialize<List<NagerHolidayDto>>(json, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
                    foreach (var h in holidays)
                    {
                        bool exists = _context.Holidays.Any(x => x.Name == h.LocalName && x.StartDate == h.Date && x.EndDate == h.Date);
                        if (!exists)
                        {
                            _context.Holidays.Add(new Holiday
                            {
                                Name = h.LocalName,
                                StartDate = h.Date,
                                EndDate = h.Date,
                                IsActive = true
                            });
                        }
                    }
                    _context.SaveChanges();
                }
            }
            // --- END HOLIDAY SYNC ---

            // Check for partial conflicts (overlapping hours) - servis ile
            var existingReservations = _context.Reservations.Where(r =>
                r.ClassroomId == Reservation.ClassroomId &&
                r.TermId == Reservation.TermId &&
                r.Status != "Rejected").ToList();
            bool hasPartialConflict = _reservationService.HasConflict(Reservation, existingReservations);
            if (hasPartialConflict)
            {
                TempData["Warning"] = "Warning: Some hours of this reservation overlap with existing reservations. Overlapping slots will be shown as 'Conflict!' in the calendar.";
            }

            // Tekrar eden rezervasyonlar
            if (RepeatWeekly)
            {
                var term = _context.Terms.FirstOrDefault(t => t.Id == Reservation.TermId);
                if (term != null)
                {
                    var start = Reservation.StartTime;
                    var end = Reservation.EndTime;
                    var reservationsToAdd = new List<Reservation>();
                    var holidays = _context.Holidays.Where(h => h.IsActive).ToList();
                    while (start <= term.EndDate && end <= term.EndDate)
                    {
                        var tempReservation = new Reservation
                        {
                            ClassroomId = Reservation.ClassroomId,
                            TermId = Reservation.TermId,
                            UserId = userId,
                            Status = "Pending",
                            StartTime = start,
                            EndTime = end
                        };
                        bool holidayConflict = _reservationService.HasHolidayConflict(tempReservation, holidays);
                        if (!holidayConflict)
                        {
                            reservationsToAdd.Add(tempReservation);
                        }
                        start = start.AddDays(7);
                        end = end.AddDays(7);
                    }
                    _context.Reservations.AddRange(reservationsToAdd);
                    _context.SaveChanges();
                    _logService.LogActivityAsync("Reservation Created (Weekly)", "Success", $"User: {userId}, Class: {Reservation.ClassroomId}, Term: {Reservation.TermId}, Start: {Reservation.StartTime}, End: {Reservation.EndTime}, Count: {reservationsToAdd.Count}").Wait();
                    TempData["Success"] = $"{reservationsToAdd.Count} weekly reservations have been created successfully.";
                    return RedirectToPage("Index");
                }
            }
            // Holiday conflict check - servis ile
            var allHolidays = _context.Holidays.Where(h => h.IsActive).ToList();
            bool singleHolidayConflict = _reservationService.HasHolidayConflict(Reservation, allHolidays);
            if (singleHolidayConflict)
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
            _context.Reservations.Add(Reservation);
            _context.SaveChanges();
            _logService.LogActivityAsync("Reservation Created", "Success", $"User: {userId}, Class: {Reservation.ClassroomId}, Term: {Reservation.TermId}, Start: {Reservation.StartTime}, End: {Reservation.EndTime}").Wait();
            TempData["Success"] = "Reservation has been created successfully.";
            return RedirectToPage("Index");
        }

        private class NagerHolidayDto
        {
            public string LocalName { get; set; }
            public DateTime Date { get; set; }
        }
    }
} 
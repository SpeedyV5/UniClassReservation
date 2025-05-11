using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Instructor.Reservations
{
    [Authorize(Roles = "Instructor")]
    public class DeleteModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public DeleteModel(ApplicationDbContext context)
        {
            _context = context;
        }
        [BindProperty]
        public Reservation Reservation { get; set; } = new();
        public IActionResult OnGet(int id)
        {
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            Reservation = _context.Reservations
                .Include(r => r.Term)
                .Include(r => r.Classroom)
                .FirstOrDefault(r => r.Id == id && r.UserId == userId);
            if (Reservation == null)
                return RedirectToPage("Index");
            return Page();
        }
        public IActionResult OnPost()
        {
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            var reservationInDb = _context.Reservations.FirstOrDefault(r => r.Id == Reservation.Id && r.UserId == userId);
            if (reservationInDb != null)
            {
                _context.Reservations.Remove(reservationInDb);
                _context.SaveChanges();
            }
            return RedirectToPage("Index");
        }
    }
} 
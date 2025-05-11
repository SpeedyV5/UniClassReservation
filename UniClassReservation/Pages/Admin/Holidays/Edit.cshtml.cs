using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System.Linq;

namespace UniClassReservation.Pages.Admin.Holidays
{
    [Authorize(Roles = "Admin")]
    public class EditModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public EditModel(ApplicationDbContext context)
        {
            _context = context;
        }
        [BindProperty]
        public Holiday Holiday { get; set; } = new();
        public IActionResult OnGet(int id)
        {
            Holiday = _context.Holidays.FirstOrDefault(h => h.Id == id);
            if (Holiday == null)
                return RedirectToPage("Index");
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
                return Page();
            var holidayInDb = _context.Holidays.FirstOrDefault(h => h.Id == Holiday.Id);
            if (holidayInDb == null)
                return RedirectToPage("Index");
            holidayInDb.Name = Holiday.Name;
            holidayInDb.StartDate = Holiday.StartDate;
            holidayInDb.EndDate = Holiday.EndDate;
            holidayInDb.IsActive = Holiday.IsActive;
            _context.SaveChanges();
            return RedirectToPage("Index");
        }
    }
} 
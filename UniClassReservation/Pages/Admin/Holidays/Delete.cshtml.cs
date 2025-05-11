using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System.Linq;

namespace UniClassReservation.Pages.Admin.Holidays
{
    [Authorize(Roles = "Admin")]
    public class DeleteModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public DeleteModel(ApplicationDbContext context)
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
            var holidayInDb = _context.Holidays.FirstOrDefault(h => h.Id == Holiday.Id);
            if (holidayInDb != null)
            {
                if (!string.IsNullOrEmpty(holidayInDb.SeriesId))
                {
                    // Soft delete all holidays in the same series
                    var seriesHolidays = _context.Holidays.Where(h => h.SeriesId == holidayInDb.SeriesId).ToList();
                    foreach (var h in seriesHolidays)
                        h.IsActive = false;
                }
                else
                {
                    holidayInDb.IsActive = false;
                }
                _context.SaveChanges();
            }
            return RedirectToPage("Index");
        }
    }
} 
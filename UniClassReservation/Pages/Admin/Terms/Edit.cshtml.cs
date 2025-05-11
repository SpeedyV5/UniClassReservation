using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Terms
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
        public Term Term { get; set; } = new();
        public IActionResult OnGet(int id)
        {
            Term = _context.Terms.FirstOrDefault(t => t.Id == id);
            if (Term == null)
                return RedirectToPage("Index");
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
                return Page();
            var termInDb = _context.Terms.FirstOrDefault(t => t.Id == Term.Id);
            if (termInDb == null)
                return RedirectToPage("Index");
            termInDb.Name = Term.Name;
            termInDb.StartDate = Term.StartDate;
            termInDb.EndDate = Term.EndDate;
            termInDb.IsActive = Term.IsActive;
            _context.SaveChanges();
            return RedirectToPage("Index");
        }
    }
} 
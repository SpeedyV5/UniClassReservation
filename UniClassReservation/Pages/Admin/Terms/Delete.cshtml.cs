using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Terms
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
            var termInDb = _context.Terms.FirstOrDefault(t => t.Id == Term.Id);
            if (termInDb != null)
            {
                termInDb.IsActive = false;
                _context.SaveChanges();
            }
            return RedirectToPage("Index");
        }
    }
} 
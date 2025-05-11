using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Classrooms
{
    [Authorize(Roles = "Admin")]
    public class CreateModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public CreateModel(ApplicationDbContext context)
        {
            _context = context;
        }
        [BindProperty]
        public Classroom Classroom { get; set; } = new();
        public IActionResult OnGet()
        {
            return Page();
        }
        public IActionResult OnPost()
        {
            if (!ModelState.IsValid)
                return Page();
            _context.Classrooms.Add(Classroom);
            _context.SaveChanges();
            TempData["Success"] = "Classroom has been created successfully.";
            return RedirectToPage("Index");
        }
    }
} 
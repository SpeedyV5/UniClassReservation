using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Classrooms
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
        public Classroom Classroom { get; set; } = new();
        public IActionResult OnGet(int id)
        {
            Classroom = _context.Classrooms.FirstOrDefault(c => c.Id == id);
            if (Classroom == null)
                return RedirectToPage("Index");
            return Page();
        }
        public IActionResult OnPost()
        {
            var classroomInDb = _context.Classrooms.FirstOrDefault(c => c.Id == Classroom.Id);
            if (classroomInDb != null)
            {
                classroomInDb.IsActive = false;
                _context.SaveChanges();
            }
            return RedirectToPage("Index");
        }
    }
} 
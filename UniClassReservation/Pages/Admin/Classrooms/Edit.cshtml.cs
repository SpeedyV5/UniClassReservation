using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Classrooms
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
            if (!ModelState.IsValid)
                return Page();
            var classroomInDb = _context.Classrooms.FirstOrDefault(c => c.Id == Classroom.Id);
            if (classroomInDb == null)
                return RedirectToPage("Index");
            classroomInDb.Name = Classroom.Name;
            classroomInDb.Capacity = Classroom.Capacity;
            classroomInDb.Location = Classroom.Location;
            classroomInDb.IsActive = Classroom.IsActive;
            _context.SaveChanges();
            TempData["Success"] = "Classroom has been updated successfully.";
            return RedirectToPage("Index");
        }
    }
} 
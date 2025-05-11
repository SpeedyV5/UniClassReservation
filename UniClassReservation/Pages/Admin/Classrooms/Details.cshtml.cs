using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using UniClassReservation.Data;

namespace UniClassReservation.Pages.Admin.Classrooms
{
    [Authorize(Roles = "Admin")]
    public class DetailsModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public DetailsModel(ApplicationDbContext context)
        {
            _context = context;
        }

        public UniClassReservation.Models.Classroom Classroom { get; set; }
        public List<UniClassReservation.Models.Feedback> Feedbacks { get; set; } = new();
        public double AverageRating { get; set; }
        public int FeedbackCount { get; set; }

        public async Task<IActionResult> OnGetAsync(int id)
        {
            Classroom = await _context.Classrooms
                .FirstOrDefaultAsync(c => c.Id == id);
            if (Classroom == null)
            {
                return NotFound();
            }

            Feedbacks = await _context.Feedbacks
                .Where(f => f.ClassroomId == id)
                .OrderByDescending(f => f.CreatedAt)
                .ToListAsync();

            AverageRating = Classroom.AverageRating;
            FeedbackCount = Classroom.FeedbackCount;

            return Page();
        }
    }
} 
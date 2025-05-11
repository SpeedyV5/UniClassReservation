using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Classrooms
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public IndexModel(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Classroom> Classrooms { get; set; } = new();
        public Dictionary<int, double> ClassroomAverageRatings { get; set; } = new();
        public void OnGet()
        {
            Classrooms = _context.Classrooms.Where(c => c.IsActive).OrderBy(c => c.Name).ToList();
            var feedbacks = _context.Feedbacks.ToList();
            foreach (var classroom in Classrooms)
            {
                var classFeedbacks = feedbacks.Where(f => f.ClassroomId == classroom.Id).ToList();
                if (classFeedbacks.Any())
                {
                    ClassroomAverageRatings[classroom.Id] = classFeedbacks.Average(f => f.Rating);
                }
                else
                {
                    ClassroomAverageRatings[classroom.Id] = 0;
                }
            }
        }

        public void OnPostDelete(int id)
        {
            var classroom = _context.Classrooms.FirstOrDefault(c => c.Id == id);
            if (classroom != null)
            {
                classroom.IsActive = false;
                _context.SaveChanges();
                TempData["Success"] = "Classroom has been deleted successfully.";
            }
            OnGet();
        }
    }
} 
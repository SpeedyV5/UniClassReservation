using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using System.Collections.Generic;
using System.Linq;

namespace UniClassReservation.Pages.Instructor.Feedback
{
    [Authorize(Roles = "Instructor")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public IndexModel(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<UniClassReservation.Models.Feedback> Feedbacks { get; set; } = new();
        public void OnGet()
        {
            var userId = _context.Users.FirstOrDefault(u => u.UserName == User.Identity.Name)?.Id;
            Feedbacks = _context.Feedbacks
                .Where(f => f.UserId == userId)
                .OrderByDescending(f => f.CreatedAt)
                .ToList();
        }

        public void OnPost()
        {
            // This method is called when the form is submitted
            // You can handle the form submission here
            TempData["Success"] = "Your feedback has been marked as read.";
        }
    }
} 
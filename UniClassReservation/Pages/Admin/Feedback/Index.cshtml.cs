using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System.Collections.Generic;
using System.Linq;

namespace UniClassReservation.Pages.Admin.Feedback
{
    [Authorize(Roles = "Admin")]
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
            Feedbacks = _context.Feedbacks.OrderByDescending(f => f.CreatedAt).ToList();
        }
        public void OnPostMarkAsRead(int id)
        {
            var feedback = _context.Feedbacks.FirstOrDefault(f => f.Id == id);
            if (feedback != null && !feedback.IsRead)
            {
                feedback.IsRead = true;
                _context.SaveChanges();
            }
            OnGet();
        }
    }
} 
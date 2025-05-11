using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin.Terms
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public IndexModel(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Term> Terms { get; set; } = new();
        public void OnGet()
        {
            Terms = _context.Terms.Where(t => t.IsActive).OrderByDescending(t => t.StartDate).ToList();
        }
    }
} 
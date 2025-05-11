using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Authorization;
using UniClassReservation.Data;
using UniClassReservation.Models;
using Microsoft.EntityFrameworkCore;

namespace UniClassReservation.Pages;

[Authorize]
public class IndexModel : PageModel
{
    private readonly ILogger<IndexModel> _logger;
    private readonly ApplicationDbContext _context;

    public IndexModel(ILogger<IndexModel> logger, ApplicationDbContext context)
    {
        _logger = logger;
        _context = context;
    }

    public int TotalClassrooms { get; set; }
    public int ActiveReservations { get; set; }
    public double AverageRating { get; set; }

    public async Task OnGetAsync()
    {
        TotalClassrooms = await _context.Classrooms.CountAsync();
        ActiveReservations = await _context.Reservations
            .Where(r => r.StartTime > DateTime.Now)
            .CountAsync();
        AverageRating = await _context.Feedbacks
            .AverageAsync(f => f.Rating);
    }
}

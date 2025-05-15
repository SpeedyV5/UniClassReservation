using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace UniClassReservation.Pages.Admin.Holidays
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        private readonly ApplicationDbContext _context;
        public IndexModel(ApplicationDbContext context)
        {
            _context = context;
        }
        public List<Holiday> Holidays { get; set; } = new();
        public async Task OnGetAsync()
        {
            var year = DateTime.Now.Year;
            // If official holidays for this year are not added, add them automatically
            bool hasAny = _context.Holidays.Any(h => h.StartDate.Year == year);
            if (!hasAny)
            {
                await ImportOfficialHolidays(year);
            }
            Holidays = _context.Holidays
                .Where(h => h.IsActive)
                .OrderByDescending(h => h.StartDate)
                .ToList()
                .GroupBy(h => h.SeriesId ?? h.Name)
                .Select(g => g.First())
                .ToList();
        }

        private async Task ImportOfficialHolidays(int year)
        {
            var url = $"https://date.nager.at/api/v3/PublicHolidays/{year}/TR";
            using var httpClient = new HttpClient();
            var response = await httpClient.GetAsync(url);
            if (response.IsSuccessStatusCode)
            {
                var json = await response.Content.ReadAsStringAsync();
                var holidays = JsonSerializer.Deserialize<List<NagerHolidayDto>>(json, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
                foreach (var h in holidays)
                {
                    bool exists = _context.Holidays.Any(x => x.Name == h.LocalName && x.StartDate == h.Date && x.EndDate == h.Date);
                    if (!exists)
                    {
                        _context.Holidays.Add(new Holiday
                        {
                            Name = h.LocalName,
                            StartDate = h.Date,
                            EndDate = h.Date,
                            IsActive = true
                        });
                    }
                }
                await _context.SaveChangesAsync();
            }
        }

        public class NagerHolidayDto
        {
            public string LocalName { get; set; }
            public DateTime Date { get; set; }
        }
    }
} 
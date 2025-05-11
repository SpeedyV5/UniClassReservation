using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Data;
using UniClassReservation.Models;
using System;

namespace UniClassReservation.Pages.Admin.Holidays
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
        public Holiday Holiday { get; set; } = new();
        public IActionResult OnGet()
        {
            return Page();
        }
        public IActionResult OnPost(string repeatType)
        {
            if (!ModelState.IsValid)
                return Page();

            var holidaysToAdd = new List<Holiday>();
            var start = Holiday.StartDate.Date;
            var end = Holiday.EndDate.Date;
            var yearEnd = new DateTime(start.Year, 12, 31);
            string? seriesId = null;
            if (repeatType == "weekly" || repeatType == "monthly" || repeatType == "yearly")
            {
                seriesId = Guid.NewGuid().ToString();
            }

            if (repeatType == "weekly")
            {
                while (start <= yearEnd)
                {
                    holidaysToAdd.Add(new Holiday
                    {
                        Name = Holiday.Name + " (Weekly)",
                        StartDate = start,
                        EndDate = end,
                        IsActive = Holiday.IsActive,
                        SeriesId = seriesId
                    });
                    start = start.AddDays(7);
                    end = end.AddDays(7);
                }
            }
            else if (repeatType == "monthly")
            {
                while (start <= yearEnd)
                {
                    holidaysToAdd.Add(new Holiday
                    {
                        Name = Holiday.Name + " (Monthly)",
                        StartDate = start,
                        EndDate = end,
                        IsActive = Holiday.IsActive,
                        SeriesId = seriesId
                    });
                    start = start.AddMonths(1);
                    end = end.AddMonths(1);
                }
            }
            else if (repeatType == "yearly")
            {
                for (int i = 0; i < 5; i++)
                {
                    holidaysToAdd.Add(new Holiday
                    {
                        Name = Holiday.Name + " (Yearly)",
                        StartDate = start,
                        EndDate = end,
                        IsActive = Holiday.IsActive,
                        SeriesId = seriesId
                    });
                    start = start.AddYears(1);
                    end = end.AddYears(1);
                }
            }
            else // none
            {
                holidaysToAdd.Add(Holiday);
            }
            _context.Holidays.AddRange(holidaysToAdd);
            _context.SaveChanges();
            return RedirectToPage("Index");
        }
    }
} 
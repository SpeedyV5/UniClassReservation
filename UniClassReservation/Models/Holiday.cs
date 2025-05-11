using System;

namespace UniClassReservation.Models
{
    public class Holiday
    {
        public int Id { get; set; }
        public string Name { get; set; } // Tatil adı
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsActive { get; set; } = true;
        public string? SeriesId { get; set; }
    }
} 
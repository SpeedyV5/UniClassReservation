namespace UniClassReservation.Models
{
    public class Term
    {
        public int Id { get; set; }
        public string Name { get; set; } // Örn: 2024 Bahar
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public bool IsActive { get; set; } = true;
    }
} 
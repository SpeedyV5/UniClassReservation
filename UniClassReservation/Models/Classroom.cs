namespace UniClassReservation.Models
{
    public class Classroom
    {
        public int Id { get; set; }
        public string Name { get; set; } // Örn: A101
        public int Capacity { get; set; }
        public string Location { get; set; }
        public bool IsActive { get; set; } = true;
        public double AverageRating { get; set; } = 0;
        public int FeedbackCount { get; set; } = 0;
    }
} 
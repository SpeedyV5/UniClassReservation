using System;

namespace UniClassReservation.Models
{
    public class Feedback
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        public string UserName { get; set; }
        public string Message { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public bool IsRead { get; set; } = false;
        public int Rating { get; set; } // 1-5 arası yıldız puanı
        public int? ClassroomId { get; set; }
        public Classroom Classroom { get; set; }
        public string ClassroomName { get; set; }
    }
} 
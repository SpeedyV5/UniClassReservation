using Microsoft.AspNetCore.Identity;

namespace UniClassReservation.Models
{
    public class ApplicationUser : IdentityUser
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Department { get; set; }
        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
        public bool IsActive { get; set; } = true;
        public string DefaultRole { get; set; } = "User"; // Yeni kullanıcılar için varsayılan rol
    }
} 
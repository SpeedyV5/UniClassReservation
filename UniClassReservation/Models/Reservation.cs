using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;

namespace UniClassReservation.Models
{
    public class Reservation
    {
        public int Id { get; set; }
        [BindNever, ValidateNever]
        public string UserId { get; set; }
        public int ClassroomId { get; set; }
        public int TermId { get; set; }
        public DateTime StartTime { get; set; }
        public DateTime EndTime { get; set; }
        [BindNever, ValidateNever]
        public string Status { get; set; } // Pending, Approved, Rejected
        public string? AdminNote { get; set; }

        // Navigation Properties
        [ForeignKey("UserId")]
        [ValidateNever]
        public ApplicationUser User { get; set; }
        [ValidateNever]
        public Classroom Classroom { get; set; }
        [ValidateNever]
        public Term Term { get; set; }
    }
} 
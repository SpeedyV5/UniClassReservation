using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using UniClassReservation.Models;

namespace UniClassReservation.Data
{
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options)
        {
        }

        public DbSet<Term> Terms { get; set; }
        public DbSet<Classroom> Classrooms { get; set; }
        public DbSet<Reservation> Reservations { get; set; }
        public DbSet<Holiday> Holidays { get; set; }
        public DbSet<Feedback> Feedbacks { get; set; }
    }
} 
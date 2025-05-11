using Microsoft.AspNetCore.Identity;
using UniClassReservation.Models;

namespace UniClassReservation.Data
{
    public static class SeedData
    {
        public static async Task Initialize(IServiceProvider serviceProvider)
        {
            var roleManager = serviceProvider.GetRequiredService<RoleManager<IdentityRole>>();
            var userManager = serviceProvider.GetRequiredService<UserManager<ApplicationUser>>();

            // Rolleri oluştur
            string[] roles = new[] { "Admin", "Instructor", "User" };
            foreach (var role in roles)
            {
                if (!await roleManager.RoleExistsAsync(role))
                {
                    await roleManager.CreateAsync(new IdentityRole(role));
                }
            }

            // Admin kullanıcısı oluştur
            string adminEmail = "admin@university.edu";
            string adminPassword = "Admin123!";
            if (await userManager.FindByEmailAsync(adminEmail) == null)
            {
                var adminUser = new ApplicationUser
                {
                    UserName = adminEmail,
                    Email = adminEmail,
                    EmailConfirmed = true,
                    FirstName = "Admin",
                    LastName = "User",
                    Department = "IT",
                    DefaultRole = "Admin"
                };
                var result = await userManager.CreateAsync(adminUser, adminPassword);
                if (result.Succeeded)
                {
                    await userManager.AddToRoleAsync(adminUser, "Admin");
                }
            }
        }

        public static void UpdateClassroomFeedbackStats(ApplicationDbContext context)
        {
            var classrooms = context.Classrooms.ToList();
            var feedbacks = context.Feedbacks.ToList();
            foreach (var classroom in classrooms)
            {
                var classFeedbacks = feedbacks.Where(f => f.ClassroomId == classroom.Id).ToList();
                classroom.FeedbackCount = classFeedbacks.Count;
                classroom.AverageRating = classFeedbacks.Any() ? classFeedbacks.Average(f => f.Rating) : 0;
            }
            context.SaveChanges();
        }
    }
} 
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using UniClassReservation.Models;

namespace UniClassReservation.Pages.Admin
{
    [Authorize(Roles = "Admin")]
    public class IndexModel : PageModel
    {
        public UserManager<ApplicationUser> UserManager { get; }
        private readonly RoleManager<IdentityRole> _roleManager;

        public IndexModel(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager)
        {
            UserManager = userManager;
            _roleManager = roleManager;
        }

        public List<ApplicationUser> Users { get; set; } = new();
        [BindProperty]
        public string SelectedUserId { get; set; }
        [BindProperty]
        public string ActionType { get; set; }

        public class AddInstructorInputModel
        {
            public string Email { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string Department { get; set; }
            public string Password { get; set; }
        }

        [BindProperty]
        public AddInstructorInputModel AddInstructorInput { get; set; }
        public string AddInstructorResult { get; set; }

        public async Task OnGetAsync()
        {
            Users = UserManager.Users.Where(u => u.IsActive).ToList();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await UserManager.FindByIdAsync(SelectedUserId);
            if (user != null)
            {
                if (ActionType == "add-instructor")
                {
                    if (!await UserManager.IsInRoleAsync(user, "Instructor"))
                        await UserManager.AddToRoleAsync(user, "Instructor");
                }
                else if (ActionType == "remove-instructor")
                {
                    if (await UserManager.IsInRoleAsync(user, "Instructor"))
                        await UserManager.RemoveFromRoleAsync(user, "Instructor");
                    user.IsActive = false;
                    await UserManager.UpdateAsync(user);
                }
            }
            return RedirectToPage();
        }

        public async Task<IActionResult> OnPostAddInstructorAsync()
        {
            if (string.IsNullOrWhiteSpace(AddInstructorInput?.Email) ||
                string.IsNullOrWhiteSpace(AddInstructorInput?.FirstName) ||
                string.IsNullOrWhiteSpace(AddInstructorInput?.LastName) ||
                string.IsNullOrWhiteSpace(AddInstructorInput?.Department) ||
                string.IsNullOrWhiteSpace(AddInstructorInput?.Password))
            {
                AddInstructorResult = "All fields are required.";
                await OnGetAsync();
                return Page();
            }

            var existingUser = await UserManager.FindByEmailAsync(AddInstructorInput.Email);
            if (existingUser != null)
            {
                AddInstructorResult = "A user with this email already exists.";
                await OnGetAsync();
                return Page();
            }

            var newUser = new ApplicationUser
            {
                UserName = AddInstructorInput.Email,
                Email = AddInstructorInput.Email,
                FirstName = AddInstructorInput.FirstName,
                LastName = AddInstructorInput.LastName,
                Department = AddInstructorInput.Department,
                EmailConfirmed = true
            };
            var result = await UserManager.CreateAsync(newUser, AddInstructorInput.Password);
            if (result.Succeeded)
            {
                await UserManager.AddToRoleAsync(newUser, "Instructor");
                AddInstructorResult = "Instructor successfully added.";
            }
            else
            {
                AddInstructorResult = string.Join(" ", result.Errors.Select(e => e.Description));
            }
            await OnGetAsync();
            return Page();
        }
    }
} 
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

        public async Task OnGetAsync()
        {
            Users = UserManager.Users.ToList();
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
                }
            }
            return RedirectToPage();
        }
    }
} 
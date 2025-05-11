using System;
using System.IO;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace UniClassReservation.Services
{
    public class LogService
    {
        private readonly string _activityLogPath = Path.Combine("logs", "activity.log");
        private readonly string _errorLogPath = Path.Combine("logs", "error.log");
        private readonly IHttpContextAccessor _httpContextAccessor;

        public LogService(IHttpContextAccessor httpContextAccessor)
        {
            _httpContextAccessor = httpContextAccessor;
            Directory.CreateDirectory("logs");
        }

        public async Task LogActivityAsync(string action, string status, string details = "")
        {
            var user = _httpContextAccessor.HttpContext?.User?.Identity?.Name ?? "Anonymous";
            var log = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [User: {user}] [Action: {action}] [Status: {status}] [Details: {details}]";
            await File.AppendAllTextAsync(_activityLogPath, log + Environment.NewLine);
        }

        public async Task LogErrorAsync(string action, string error)
        {
            var user = _httpContextAccessor.HttpContext?.User?.Identity?.Name ?? "Anonymous";
            var log = $"[{DateTime.Now:yyyy-MM-dd HH:mm:ss}] [User: {user}] [Action: {action}] [ERROR] [Details: {error}]";
            await File.AppendAllTextAsync(_errorLogPath, log + Environment.NewLine);
        }
    }
} 
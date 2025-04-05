using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations.Schema;

namespace CodePulse.API.Models.Domain
{
    public class UserProfile
    {
        public Guid Id { get; set; } = Guid.NewGuid();
        
        public required string UserId { get; set; }
        public required string FullName { get; set; }
        public string? Bio { get; set; }
        public string? PhotoUrl { get; set; }

        [ForeignKey(nameof(UserId))]
        public IdentityUser? User { get; set; }
    }
}


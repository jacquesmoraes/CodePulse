using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
 
    public class RegisterRequestDto
    {
       
        [Required]
        public string UserName { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        public string Password { get; set; }

       
        public string FullName { get; set; }

        public string? Bio { get; set; }

        public string? InitialRole { get; set; }
    }
}

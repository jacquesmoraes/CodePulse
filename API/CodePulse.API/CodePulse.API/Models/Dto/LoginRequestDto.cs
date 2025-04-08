using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
  public class LoginRequestDto
  {
    [Required(ErrorMessage = "Email is required")]
    [EmailAddress(ErrorMessage = "Invalid email format")]
    public string Email { get; set; }

    [Required(ErrorMessage = "Password is required")]
    public string Password { get; set; }
  }
}

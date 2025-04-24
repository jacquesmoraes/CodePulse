using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
  public class ForgotPasswordRequestDto
  {
    [Required ( ErrorMessage = "email required" )]
    [EmailAddress ( ErrorMessage = "invalid email" )]
    public string Email { get; set; }

       [Required(ErrorMessage = "Client URL is required")]
    public string ClientUrl { get; set; }
  }
}

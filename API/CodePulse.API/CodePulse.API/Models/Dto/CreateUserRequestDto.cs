using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
  
  public class CreateUserRequestDto
  {
   
     public string FullName { get; set; } = string.Empty;

    public string UserName { get; set; } = string.Empty;

    public string Email { get; set; } = string.Empty;

    public string Password { get; set; } = string.Empty;

    public string Bio { get; set; } = string.Empty;

    public string Interests { get; set; } = string.Empty;

    public string Role { get; set; } = "Reader"; 
  }
}

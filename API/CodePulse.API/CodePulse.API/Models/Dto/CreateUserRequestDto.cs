using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
  /// <summary>
  /// DTO para criação de usuários pelo admin
  /// </summary>
  public class CreateUserRequestDto
  {
    /// <summary>
    /// Email do usuário
    /// </summary>
    [Required]
    [EmailAddress]
    public string Email { get; set; }

    /// <summary>
    /// Senha do usuário
    /// </summary>
    [Required]
    public string Password { get; set; }

    /// <summary>
    /// Nome completo do usuário
    /// </summary>
    [Required]
    public string FullName { get; set; }

    /// <summary>
    /// Nome de usuário
    /// </summary>
    [Required]
    public string UserName { get; set; }

    /// <summary>
    /// Biografia do usuário (opcional)
    /// </summary>
    public string? Bio { get; set; }

    /// <summary>
    /// Role do usuário (Writer ou User)
    /// </summary>
    [Required]
    public string Role { get; set; }
  }
}

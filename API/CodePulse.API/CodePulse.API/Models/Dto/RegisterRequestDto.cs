using System.ComponentModel.DataAnnotations;

namespace CodePulse.API.Models.Dto
{
    /// <summary>
    /// DTO para registro de usuários
    /// </summary>
    public class RegisterRequestDto
    {
        /// <summary>
        /// Nome de usuário único
        /// </summary>
        [Required]
        public string UserName { get; set; }

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
        /// Biografia do usuário (opcional)
        /// </summary>
        public string? Bio { get; set; }

        /// <summary>
        /// Role inicial do usuário (opcional, padrão: "Reader")
        /// </summary>
        public string? InitialRole { get; set; }
    }
}

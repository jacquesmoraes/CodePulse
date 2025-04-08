namespace CodePulse.API.Models.Dto
{
    /// <summary>
    /// DTO para resposta de registro de usuários
    /// </summary>
    public class RegisterResponseDto
    {
        /// <summary>
        /// ID do usuário
        /// </summary>
        public string Id { get; set; }

        /// <summary>
        /// Nome de usuário
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// Email do usuário
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// Nome completo do usuário
        /// </summary>
        public string FullName { get; set; }

        /// <summary>
        /// Biografia do usuário
        /// </summary>
        public string? Bio { get; set; }

        /// <summary>
        /// Interesses do usuário
        /// </summary>
        public string? Interests { get; set; }

        /// <summary>
        /// URL da imagem do usuário
        /// </summary>
        public string? ImageUrl { get; set; }

        /// <summary>
        /// Role do usuário
        /// </summary>
        public string Role { get; set; }

        /// <summary>
        /// Mensagem de sucesso
        /// </summary>
        public string Message { get; set; }
    }
} 
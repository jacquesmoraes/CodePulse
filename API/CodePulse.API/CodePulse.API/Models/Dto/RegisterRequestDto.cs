namespace CodePulse.API.Models.Dto
{
    public class RegisterRequestDto
    {
        public required string UserName { get; set; }
        public required string Email { get; set; }
        public required string Password { get; set; }

        public required string FullName { get; set; }
        public string? Bio { get; set; }
        public string? PhotoUrl { get; set; }
    }
}

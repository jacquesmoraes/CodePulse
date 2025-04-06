namespace CodePulse.API.Models.Dto
{
  public class UpdateUserRequestDto
  {
    public required string Email { get; set; }
        public required string FullName { get; set; }
        public required string UserName { get; set; }
        public string? Bio { get; set; }
        public Guid? ImageId { get; set; }
  }
}

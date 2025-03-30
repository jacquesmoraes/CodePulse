namespace CodePulse.API.Models.Dto
{
  public class AddCommentRequestDto
  {
   
    public string Content { get; set; } = string.Empty;
    public Guid BlogPostId { get; set; }


  }
}

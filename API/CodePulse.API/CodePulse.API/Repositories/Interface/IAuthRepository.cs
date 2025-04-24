using CodePulse.API.Models.Dto;

namespace CodePulse.API.Repositories.Interface
{
  public interface IAuthRepository
  {
      public Task<bool> ForgotPasswordAsync(ForgotPasswordRequestDto dto);

    public Task<bool> ResetPasswordAsync ( ResetPasswordRequestDto dto );
  }
}

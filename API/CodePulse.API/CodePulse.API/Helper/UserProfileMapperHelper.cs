using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Helper;
public static class UserProfileMapperHelper
{
    public static UserProfileDto MapToDto(UserProfile profile, HttpRequest request)
    {
        return new UserProfileDto
        {
            Id = profile.Id,
            UserName = profile.UserName,
            FullName = profile.FullName,
            Email = profile.Email,
            Bio = profile.Bio,
            Interests = profile.Interests,
            ImageUrl = profile.Image != null
                ? $"{request.Scheme}://{request.Host}/{profile.Image.Url}"
                : null
        };
    }

    public static void MapToDomain(UserProfile profile, UpdateUserProfileRequestDto request)
    {
        profile.FullName = request.FullName;
        profile.UserName = request.UserName;
        profile.Bio = request.Bio;
    profile.Interests = request.Interests;
        // A imagem (ImageId) deve ser tratada no repositório após upload.
    }
}

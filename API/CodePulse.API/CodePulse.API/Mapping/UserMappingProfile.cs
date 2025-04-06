using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
{
    public class UserMappingProfile : Profile
    {
        public UserMappingProfile()
        {
            // UserProfile -> UserProfileDto
            CreateMap<UserProfile, UserProfileDto>()
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.User.Email))
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.UserName))
                .ForMember(dest => dest.ImageUrl, opt => opt.MapFrom(src => src.Image != null ? src.Image.Url : null));

            // CreateUserRequestDto -> UserProfile
            CreateMap<CreateUserRequestDto, UserProfile>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => Guid.NewGuid()));

            // UpdateUserRequestDto -> UserProfile
            CreateMap<UpdateUserRequestDto, UserProfile>();

            // UpdateUserProfileRequestDto -> UserProfile
            CreateMap<UpdateUserProfileRequestDto, UserProfile>();
       CreateMap<UserProfile, UpdateUserProfileResponseDto>();
        CreateMap<UserImageProfile, UserImageProfileDto>();
        }
    }
}

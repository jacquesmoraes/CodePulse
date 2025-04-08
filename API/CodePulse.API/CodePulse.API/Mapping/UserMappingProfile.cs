using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
{
    public class UserMappingProfile : Profile
    {
        public UserMappingProfile()
        {
            // UserProfile -> RegisterResponseDto
            CreateMap<UserProfile, RegisterResponseDto>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.UserName, opt => opt.MapFrom(src => src.UserName))
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
                .ForMember(dest => dest.FullName, opt => opt.MapFrom(src => src.FullName))
                .ForMember(dest => dest.Bio, opt => opt.MapFrom(src => src.Bio))
                .ForMember(dest => dest.Interests, opt => opt.MapFrom(src => src.Interests))
                .ForMember(dest => dest.ImageUrl, opt => opt.MapFrom(src => src.Image != null ? src.Image.Url : null))
                .ForMember(dest => dest.Role, opt => opt.MapFrom(src => "User"))  // Default role for new registrations
                .ForMember(dest => dest.Message, opt => opt.MapFrom(src => "Usuário registrado com sucesso"));

            // UserProfile -> UserProfileDto
            CreateMap<UserProfile, UserProfileDto>()
                .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
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

            // BlogPost mappings
            

            CreateMap<CreateBlogPostRequestDto, BlogPost>();
            CreateMap<UpdateBlogPostRequestDto, BlogPost>();
        }
    }
}

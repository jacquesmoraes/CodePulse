using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
{
  public class BlogPostMappingProfile : Profile
  {
    public BlogPostMappingProfile()
    {
      Console.WriteLine(">>> BlogPostMappingProfile carregado");
      CreateMap<CreateBlogPostRequestDto, BlogPost>()
        .ForMember(dest => dest.Categories, opt => opt.Ignore())
        .ForMember(dest => dest.AuthorId, opt => opt.Ignore())
        .ForMember(dest => dest.ViewCount, opt => opt.MapFrom(src => 0))
        .ForMember(dest => dest.Id, opt => opt.MapFrom(src => Guid.NewGuid()));

      CreateMap<UpdateBlogPostRequestDto, BlogPost>()
        .ForMember(dest => dest.Categories, opt => opt.Ignore())
        .ForMember(dest => dest.AuthorId, opt => opt.Ignore())
        .ForMember(dest => dest.ViewCount, opt => opt.Ignore());

      CreateMap<BlogImage, BlogImageDto>();
      CreateMap<UserImageProfileDto, UserImageProfile>();
      CreateMap<Category, CategoryDto>();
      CreateMap<UserImageProfile, UserImageProfileDto>();

      




    }
  }
}

using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
{
  public class BlogPostMappingProfile : Profile
  {

    public BlogPostMappingProfile() {

      //dto -> domain
      CreateMap<CreateBlogPostRequestDto, BlogPost>();

      // Domain -> DTO
      CreateMap<BlogPost, BlogPostDto>();
    }
  }
}

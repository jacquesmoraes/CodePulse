using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
  {
  public class BlogPostMappingProfile : Profile
    {

    public BlogPostMappingProfile ( ) {


      // DTO -> Domain (Criação de um novo post)
      CreateMap<CreateBlogPostRequestDto, BlogPost> ( )
          .ForMember ( dest => dest.Categories, opt => opt.MapFrom ( src =>
       src.Categories.Select ( guidId => new Category { Id = guidId }))); // Ignoramos porque vamos buscar no banco

      CreateMap<CreateCategoriesDto, Category> ( );
      CreateMap<UpdateCategoryRequestDto, Category> ( );
      CreateMap<UpdateBlogPostRequestDto, BlogPost> ( )
          .ForMember ( dest => dest.Categories, opt => opt.MapFrom ( src =>
       src.Categories.Select ( guidId => new Category { Id = guidId } ) ) );
      CreateMap<BlogImage, BlogImageDto> ( );

      // Domain -> DTO (Retornando um post com categorias)
      CreateMap<Category, CategoryDto> ( );
      CreateMap<BlogPost, BlogPostDto> ( )
          .ForMember ( dest => dest.Categories, opt => opt.MapFrom ( src => src.Categories ) ); //  Converte Categorias corretamente
      }
    }

  }

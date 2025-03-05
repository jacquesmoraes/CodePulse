using AutoMapper;
using CodePulse.API.Models.Domain;
using CodePulse.API.Models.Dto;

namespace CodePulse.API.Mapping
{
  public class CategoryMappingProfile : Profile
  {
      public CategoryMappingProfile()
    {
      //dto > dominio
      CreateMap<CreateCategoriesDto, Category>();
      CreateMap<UpdateCategoryRequestDto, Category>();
      CreateMap<CategoryDto, Category>();

      //dominio > dto
      CreateMap<Category, CategoryDto>();
    }
  }
}

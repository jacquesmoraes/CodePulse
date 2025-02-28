using CodePulse.API.Data;
using CodePulse.API.Models.Domain;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace CodePulse.API.Models.Dto
{
    public class CreateCategoriesDto
    {
        public string Name { get; set; }
        public string UrlHandle { get; set; }
    }
}


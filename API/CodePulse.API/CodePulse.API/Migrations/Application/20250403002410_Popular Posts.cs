using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations.Application
{
  /// <inheritdoc />
  public partial class PopularPosts : Migration
  {
    /// <inheritdoc />
    protected override void Up ( MigrationBuilder migrationBuilder )
    {


      migrationBuilder.AddColumn<int> (
          name: "ViewCount",
          table: "BlogPosts",
          type: "int",
          nullable: false,
          defaultValue: 0 );
    }

    /// <inheritdoc />
    protected override void Down ( MigrationBuilder migrationBuilder )
    {
      migrationBuilder.DropColumn (
          name: "ViewCount",
          table: "BlogPosts" );
    }
  }
}

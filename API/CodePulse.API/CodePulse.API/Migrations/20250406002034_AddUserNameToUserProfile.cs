using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations
{
  /// <inheritdoc />
  public partial class AddUserNameToUserProfile : Migration
  {
    /// <inheritdoc />
    protected override void Up ( MigrationBuilder migrationBuilder )
    {
      migrationBuilder.AddColumn<string> (
    name: "UserName",
    table: "UsersProfiles",
    type: "nvarchar(100)", // tipo fixo
    nullable: false,
    defaultValue: "" );

      // Atualiza registros existentes para evitar conflito
      migrationBuilder.Sql ( @"
    UPDATE UsersProfiles
    SET UserName = CONCAT('user_', NEWID())
    WHERE UserName IS NULL OR UserName = ''
" );

      // Atualiza dado seed
      migrationBuilder.UpdateData (
          table: "UsersProfiles",
          keyColumn: "Id",
          keyValue: new Guid ( "b9b29770-6a67-4c21-bbf2-e1c8dfcde122" ),
          column: "UserName",
          value: "admin" );

      // Cria índice único
      migrationBuilder.CreateIndex (
          name: "IX_UsersProfiles_UserName",
          table: "UsersProfiles",
          column: "UserName",
          unique: true );

    }


    /// <inheritdoc />
    protected override void Down ( MigrationBuilder migrationBuilder )
    {
      migrationBuilder.DropColumn (
          name: "UserName",
          table: "UsersProfiles" );

      migrationBuilder.UpdateData (
          table: "AspNetUsers",
          keyColumn: "Id",
          keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
          columns: new [] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
          values: new object [] { "053f5366-c912-45e6-9a51-e851af589743", "AQAAAAIAAYagAAAAEOpi3QftzS96g58RACS1cYcbelX/Uiu2QCskk9LJg/C7PJq8UGNA/kEvXHLH8EXlkA==", "4073f8cd-8308-4052-a311-38142722bd1e" } );
    }
  }
}

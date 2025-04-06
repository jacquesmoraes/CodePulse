using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations
{
    /// <inheritdoc />
    public partial class AddImageRelationToUserProfile : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PhotoUrl",
                table: "UsersProfiles");

            migrationBuilder.AddColumn<Guid>(
                name: "ImageId",
                table: "UsersProfiles",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "053f5366-c912-45e6-9a51-e851af589743", "AQAAAAIAAYagAAAAEOpi3QftzS96g58RACS1cYcbelX/Uiu2QCskk9LJg/C7PJq8UGNA/kEvXHLH8EXlkA==", "4073f8cd-8308-4052-a311-38142722bd1e" });

            migrationBuilder.UpdateData(
                table: "UsersProfiles",
                keyColumn: "Id",
                keyValue: new Guid("b9b29770-6a67-4c21-bbf2-e1c8dfcde122"),
                column: "ImageId",
                value: null);

            migrationBuilder.CreateIndex(
                name: "IX_UsersProfiles_ImageId",
                table: "UsersProfiles",
                column: "ImageId");

            migrationBuilder.AddForeignKey(
                name: "FK_UsersProfiles_userImageProfiles_ImageId",
                table: "UsersProfiles",
                column: "ImageId",
                principalTable: "userImageProfiles",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_UsersProfiles_userImageProfiles_ImageId",
                table: "UsersProfiles");

            migrationBuilder.DropIndex(
                name: "IX_UsersProfiles_ImageId",
                table: "UsersProfiles");

            migrationBuilder.DropColumn(
                name: "ImageId",
                table: "UsersProfiles");

            migrationBuilder.AddColumn<string>(
                name: "PhotoUrl",
                table: "UsersProfiles",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "b0779186-ec2e-4398-a605-df611ea1519d", "AQAAAAIAAYagAAAAEMipFVllSAEX7KS2d2lbzvwemt9UEKffrwYNx23Nlw4iSfrSdqBpYzjwS7I7GuPujA==", "7b0e6478-9033-4a1f-9d03-2a8ce7d9d89c" });

            migrationBuilder.UpdateData(
                table: "UsersProfiles",
                keyColumn: "Id",
                keyValue: new Guid("b9b29770-6a67-4c21-bbf2-e1c8dfcde122"),
                column: "PhotoUrl",
                value: "https://via.placeholder.com/150?text=Admin");
        }
    }
}

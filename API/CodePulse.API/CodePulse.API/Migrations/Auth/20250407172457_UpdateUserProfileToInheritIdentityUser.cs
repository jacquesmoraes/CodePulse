using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace CodePulse.API.Migrations.Auth
{
    /// <inheritdoc />
    public partial class UpdateUserProfileToInheritIdentityUser : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UsersProfiles");

            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "a8e07f31-c8e6-4738-9d78-5b6d0765ff16", "6350ca1c-7461-43c1-b058-02ac44f88f79" });

            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "d2fb80a2-bf43-4287-95dd-f64719e2f6c7", "6350ca1c-7461-43c1-b058-02ac44f88f79" });

            migrationBuilder.DeleteData(
                table: "AspNetUserRoles",
                keyColumns: new[] { "RoleId", "UserId" },
                keyValues: new object[] { "e2f16115-1c6c-494c-9416-17af701714a3", "6350ca1c-7461-43c1-b058-02ac44f88f79" });

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "a8e07f31-c8e6-4738-9d78-5b6d0765ff16");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "d2fb80a2-bf43-4287-95dd-f64719e2f6c7");

            migrationBuilder.DeleteData(
                table: "AspNetRoles",
                keyColumn: "Id",
                keyValue: "e2f16115-1c6c-494c-9416-17af701714a3");

            migrationBuilder.DeleteData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79");

            migrationBuilder.AddColumn<string>(
                name: "Bio",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "FullName",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<Guid>(
                name: "ImageId",
                table: "AspNetUsers",
                type: "uniqueidentifier",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Interests",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_ImageId",
                table: "AspNetUsers",
                column: "ImageId",
                unique: true,
                filter: "[ImageId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUsers_UserName",
                table: "AspNetUsers",
                column: "UserName",
                unique: true,
                filter: "[UserName] IS NOT NULL");

            migrationBuilder.AddForeignKey(
                name: "FK_AspNetUsers_UserImageProfiles_ImageId",
                table: "AspNetUsers",
                column: "ImageId",
                principalTable: "UserImageProfiles",
                principalColumn: "Id",
                onDelete: ReferentialAction.SetNull);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_AspNetUsers_UserImageProfiles_ImageId",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_ImageId",
                table: "AspNetUsers");

            migrationBuilder.DropIndex(
                name: "IX_AspNetUsers_UserName",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "Bio",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "FullName",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "ImageId",
                table: "AspNetUsers");

            migrationBuilder.DropColumn(
                name: "Interests",
                table: "AspNetUsers");

            migrationBuilder.CreateTable(
                name: "UsersProfiles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ImageId = table.Column<Guid>(type: "uniqueidentifier", nullable: true),
                    UserId = table.Column<string>(type: "nvarchar(450)", nullable: false),
                    Bio = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    FullName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    UserName = table.Column<string>(type: "nvarchar(450)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UsersProfiles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_UsersProfiles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_UsersProfiles_UserImageProfiles_ImageId",
                        column: x => x.ImageId,
                        principalTable: "UserImageProfiles",
                        principalColumn: "Id");
                });

            migrationBuilder.InsertData(
                table: "AspNetRoles",
                columns: new[] { "Id", "ConcurrencyStamp", "Name", "NormalizedName" },
                values: new object[,]
                {
                    { "a8e07f31-c8e6-4738-9d78-5b6d0765ff16", "a8e07f31-c8e6-4738-9d78-5b6d0765ff16", "Reader", "READER" },
                    { "d2fb80a2-bf43-4287-95dd-f64719e2f6c7", "d2fb80a2-bf43-4287-95dd-f64719e2f6c7", "Admin", "ADMIN" },
                    { "e2f16115-1c6c-494c-9416-17af701714a3", "e2f16115-1c6c-494c-9416-17af701714a3", "Writer", "WRITER" }
                });

            migrationBuilder.InsertData(
                table: "AspNetUsers",
                columns: new[] { "Id", "AccessFailedCount", "ConcurrencyStamp", "Email", "EmailConfirmed", "LockoutEnabled", "LockoutEnd", "NormalizedEmail", "NormalizedUserName", "PasswordHash", "PhoneNumber", "PhoneNumberConfirmed", "SecurityStamp", "TwoFactorEnabled", "UserName" },
                values: new object[] { "6350ca1c-7461-43c1-b058-02ac44f88f79", 0, "c600ff89-c68c-4745-a342-8231831dd0b7", "admin@codepulse.com", true, false, null, "ADMIN@CODEPULSE.COM", "ADMIN@CODEPULSE.COM", "AQAAAAIAAYagAAAAEAgSvXRMWwDB1wP3pEavAL/xbzMbXBWryrNQc620oa7TPIQxJdzzIEbohoEF67YalA==", null, false, "5dcf9ddf-16c1-4298-ae2c-73b7818e47a8", false, "Admin" });

            migrationBuilder.InsertData(
                table: "AspNetUserRoles",
                columns: new[] { "RoleId", "UserId" },
                values: new object[,]
                {
                    { "a8e07f31-c8e6-4738-9d78-5b6d0765ff16", "6350ca1c-7461-43c1-b058-02ac44f88f79" },
                    { "d2fb80a2-bf43-4287-95dd-f64719e2f6c7", "6350ca1c-7461-43c1-b058-02ac44f88f79" },
                    { "e2f16115-1c6c-494c-9416-17af701714a3", "6350ca1c-7461-43c1-b058-02ac44f88f79" }
                });

            migrationBuilder.InsertData(
                table: "UsersProfiles",
                columns: new[] { "Id", "Bio", "FullName", "ImageId", "UserId", "UserName" },
                values: new object[] { new Guid("b9b29770-6a67-4c21-bbf2-e1c8dfcde122"), "Administrador do sistema", "Administrador", null, "6350ca1c-7461-43c1-b058-02ac44f88f79", "admin" });

            migrationBuilder.CreateIndex(
                name: "IX_UsersProfiles_ImageId",
                table: "UsersProfiles",
                column: "ImageId");

            migrationBuilder.CreateIndex(
                name: "IX_UsersProfiles_UserId",
                table: "UsersProfiles",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_UsersProfiles_UserName",
                table: "UsersProfiles",
                column: "UserName",
                unique: true);
        }
    }
}

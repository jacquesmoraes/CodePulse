using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations
{
    /// <inheritdoc />
    public partial class addAdminProfileSeed : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "2a040db1-7e95-402e-9b13-63a0495dce46", "AQAAAAIAAYagAAAAEKmMVtjuvYrlMRj5bHcS5wjncpS/GOYGbu+Wqbgkeq9HKs4wx4C6PAmJvMGc/jqPtw==", "195ead7d-9041-41b0-9ba7-955dba85b3ce" });

            migrationBuilder.InsertData(
                table: "UsersProfiles",
                columns: new[] { "Id", "Bio", "FullName", "PhotoUrl", "UserId" },
                values: new object[] { new Guid("b9b29770-6a67-4c21-bbf2-e1c8dfcde122"), "Administrador do sistema", "Administrador", "https://via.placeholder.com/150?text=Admin", "6350ca1c-7461-43c1-b058-02ac44f88f79" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "UsersProfiles",
                keyColumn: "Id",
                keyValue: new Guid("b9b29770-6a67-4c21-bbf2-e1c8dfcde122"));

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "8f07d6c5-2353-4903-9a51-fac11f4c0279", "AQAAAAIAAYagAAAAEJwcnHydUJb6Xz6JA4Aef1KrK3feemnexfk9uv2BrZ9/lKFFmmnLYzT//2iCCaByOg==", "dc5a11b3-2c33-424a-9329-2db99baa4ea8" });
        }
    }
}

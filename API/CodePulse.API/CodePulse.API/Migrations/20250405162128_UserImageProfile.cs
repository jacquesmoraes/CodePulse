using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations
{
    /// <inheritdoc />
    public partial class UserImageProfile : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "userImageProfiles",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    FileName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    FileExtension = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Url = table.Column<string>(type: "nvarchar(max)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_userImageProfiles", x => x.Id);
                });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "b0779186-ec2e-4398-a605-df611ea1519d", "AQAAAAIAAYagAAAAEMipFVllSAEX7KS2d2lbzvwemt9UEKffrwYNx23Nlw4iSfrSdqBpYzjwS7I7GuPujA==", "7b0e6478-9033-4a1f-9d03-2a8ce7d9d89c" });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "userImageProfiles");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "6350ca1c-7461-43c1-b058-02ac44f88f79",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "2a040db1-7e95-402e-9b13-63a0495dce46", "AQAAAAIAAYagAAAAEKmMVtjuvYrlMRj5bHcS5wjncpS/GOYGbu+Wqbgkeq9HKs4wx4C6PAmJvMGc/jqPtw==", "195ead7d-9041-41b0-9ba7-955dba85b3ce" });
        }
    }
}

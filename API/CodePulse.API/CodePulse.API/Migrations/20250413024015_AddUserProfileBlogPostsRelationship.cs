using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace CodePulse.API.Migrations
{
    /// <inheritdoc />
    public partial class AddUserProfileBlogPostsRelationship : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BlogPosts_AspNetUsers_AuthorId",
                table: "BlogPosts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_blogImages",
                table: "blogImages");

           
            migrationBuilder.RenameTable(
                name: "blogImages",
                newName: "BlogImages");

           

            migrationBuilder.RenameIndex(
                name: "IX_blogImages_FileName",
                table: "BlogImages",
                newName: "IX_BlogImages_FileName");

            migrationBuilder.AddPrimaryKey(
                name: "PK_BlogImages",
                table: "BlogImages",
                column: "Id");

            
            migrationBuilder.AddForeignKey(
                name: "FK_BlogPosts_AspNetUsers_AuthorId",
                table: "BlogPosts",
                column: "AuthorId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_BlogPosts_AspNetUsers_AuthorId",
                table: "BlogPosts");

            migrationBuilder.DropPrimaryKey(
                name: "PK_BlogImages",
                table: "BlogImages");

          

            migrationBuilder.RenameTable(
                name: "BlogImages",
                newName: "blogImages");

        

            migrationBuilder.RenameIndex(
                name: "IX_BlogImages_FileName",
                table: "blogImages",
                newName: "IX_blogImages_FileName");

            migrationBuilder.AddPrimaryKey(
                name: "PK_blogImages",
                table: "blogImages",
                column: "Id");

          

            migrationBuilder.AddForeignKey(
                name: "FK_BlogPosts_AspNetUsers_AuthorId",
                table: "BlogPosts",
                column: "AuthorId",
                principalTable: "AspNetUsers",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}

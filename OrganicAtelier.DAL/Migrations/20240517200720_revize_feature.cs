using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OrganicAtelier.DAL.Migrations
{
    /// <inheritdoc />
    public partial class revize_feature : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Comment",
                table: "Features");

            migrationBuilder.DropColumn(
                name: "Subtitle",
                table: "Features");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Comment",
                table: "Features",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Subtitle",
                table: "Features",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: true);
        }
    }
}

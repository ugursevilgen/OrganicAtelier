using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace OrganicAtelier.DAL.Migrations
{
    /// <inheritdoc />
    public partial class SliderUpdate : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Title",
                table: "Sliders",
                newName: "Title2");

            migrationBuilder.RenameColumn(
                name: "Description",
                table: "Sliders",
                newName: "Description2");

            migrationBuilder.AddColumn<string>(
                name: "Description1",
                table: "Sliders",
                type: "nvarchar(200)",
                maxLength: 200,
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "Title1",
                table: "Sliders",
                type: "nvarchar(100)",
                maxLength: 100,
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Description1",
                table: "Sliders");

            migrationBuilder.DropColumn(
                name: "Title1",
                table: "Sliders");

            migrationBuilder.RenameColumn(
                name: "Title2",
                table: "Sliders",
                newName: "Title");

            migrationBuilder.RenameColumn(
                name: "Description2",
                table: "Sliders",
                newName: "Description");
        }
    }
}

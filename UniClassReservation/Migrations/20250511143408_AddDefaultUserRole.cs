using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniClassReservation.Migrations
{
    /// <inheritdoc />
    public partial class AddDefaultUserRole : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "DefaultRole",
                table: "AspNetUsers",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DefaultRole",
                table: "AspNetUsers");
        }
    }
}

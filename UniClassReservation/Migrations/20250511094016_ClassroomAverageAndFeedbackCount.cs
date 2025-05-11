using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniClassReservation.Migrations
{
    /// <inheritdoc />
    public partial class ClassroomAverageAndFeedbackCount : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ClassroomName",
                table: "Feedbacks",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<double>(
                name: "AverageRating",
                table: "Classrooms",
                type: "float",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<int>(
                name: "FeedbackCount",
                table: "Classrooms",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ClassroomName",
                table: "Feedbacks");

            migrationBuilder.DropColumn(
                name: "AverageRating",
                table: "Classrooms");

            migrationBuilder.DropColumn(
                name: "FeedbackCount",
                table: "Classrooms");
        }
    }
}

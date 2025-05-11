using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniClassReservation.Migrations
{
    /// <inheritdoc />
    public partial class ClassroomFeedbackFix2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "ClassroomId",
                table: "Feedbacks",
                type: "int",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Feedbacks_ClassroomId",
                table: "Feedbacks",
                column: "ClassroomId");

            migrationBuilder.AddForeignKey(
                name: "FK_Feedbacks_Classrooms_ClassroomId",
                table: "Feedbacks",
                column: "ClassroomId",
                principalTable: "Classrooms",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Feedbacks_Classrooms_ClassroomId",
                table: "Feedbacks");

            migrationBuilder.DropIndex(
                name: "IX_Feedbacks_ClassroomId",
                table: "Feedbacks");

            migrationBuilder.DropColumn(
                name: "ClassroomId",
                table: "Feedbacks");
        }
    }
}

using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace UniClassReservation.Migrations
{
    /// <inheritdoc />
    public partial class AddHolidayRecurrenceTypes : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "Day",
                table: "Holidays",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DayOfMonth",
                table: "Holidays",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DayOfWeek",
                table: "Holidays",
                type: "int",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsMonthly",
                table: "Holidays",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsRange",
                table: "Holidays",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsWeekly",
                table: "Holidays",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsYearly",
                table: "Holidays",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<int>(
                name: "Month",
                table: "Holidays",
                type: "int",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Day",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "DayOfMonth",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "DayOfWeek",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "IsMonthly",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "IsRange",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "IsWeekly",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "IsYearly",
                table: "Holidays");

            migrationBuilder.DropColumn(
                name: "Month",
                table: "Holidays");
        }
    }
}

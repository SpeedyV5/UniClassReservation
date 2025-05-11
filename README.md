# UniClassReservation

## Overview
**UniClassReservation** is a modern, web-based classroom reservation system for universities. Instructors can request classroom reservations and provide feedback, while admins manage terms, users, reservations, and monitor system activity. The platform is designed with security, usability, and maintainability in mind.

---

## Table of Contents
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup & Installation](#setup--installation)
- [Usage](#usage)
  - [Admin Panel](#admin-panel)
  - [Instructor Panel](#instructor-panel)
- [Security](#security)
- [Logging](#logging)
- [Testing](#testing)
- [Screenshots](#screenshots)
- [License](#license)

---

## Features
- **Role-based panels:** Separate dashboards for admins and instructors
- **Weekly calendar:** Modern, responsive calendar for viewing and managing reservations
- **Conflict & holiday detection:** Prevents overlapping reservations and warns for public holidays (integrated with holiday API)
- **Feedback system:** Instructors can rate and comment on classrooms; admins see average ratings and details
- **Contact system:** Instructors can send feedback to admins (with email notification)
- **Reservation approval workflow:** Admins approve/reject requests; instructors get notified by email
- **Logging:** All actions (login, reservation, feedback, etc.) are securely logged
- **Email notifications:** Automatic emails for reservation status changes and feedback
- **Security:** Passwords are hashed and salted; only admins manage users
- **Dark/Light mode:** Modern, accessible UI with theme toggle
- **Unit testing:** Automated tests for core reservation logic

---

## Technologies Used
- **C# (.NET Razor Pages)**
- **Entity Framework** with **MS SQL Server**
- **Bootstrap** (responsive UI)
- **xUnit** (unit testing)
- **MailKit** (email notifications)

---

## Setup & Installation

1. **Clone the repository:**
   ```sh
   git clone <repo-url>
   cd UniClassReservation
   ```

2. **Configure the database:**
   - Update `appsettings.json` with your SQL Server connection string.
   - Run migrations (if needed):
     ```sh
     dotnet ef database update
     ```

3. **Configure email settings:**
   - Update `appsettings.json` with your SMTP/email credentials (Gmail, Hotmail, etc.).

4. **Run the application:**
   ```sh
   dotnet run --project UniClassReservation/UniClassReservation.csproj
   ```

5. **Access the app:**
   - Open your browser and go to `https://localhost:5001` (or the port shown in the console).

---

## Usage

### Admin Panel
- Define academic terms (semesters)
- Create/manage instructor accounts
- Approve/reject reservation requests
- View class list, feedback, and average ratings
- See color-coded conflicts and holiday warnings
- Access detailed logs of all user actions

### Instructor Panel
- View weekly calendar and reservations
- Submit, edit, or cancel reservation requests (with conflict/holiday warnings)
- Receive email notifications for reservation status changes
- Provide feedback with 5-star rating and comments
- Contact admin via feedback form

---

## Security
- All passwords are securely hashed and salted.
- Only admins can create and manage user accounts.
- Role-based authorization ensures users only access their own data.

---

## Logging
- All user actions (login, reservation, feedback, etc.) are logged with timestamp, user, action, and status.
- Errors and unexpected behaviors are written to separate error logs.
- Logs are stored securely for future auditing.

---

## Testing

- Unit tests are located in the `UniClassReservation.Tests` project.
- To run tests:
  ```sh
  dotnet test UniClassReservation.Tests/UniClassReservation.Tests.csproj
  ```
- Example tests include reservation conflict logic and holiday detection.

---

## License

This project is for educational purposes.

---

**Developed as a university project.** 
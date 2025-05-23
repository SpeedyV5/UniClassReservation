USE [master]
GO
/****** Object:  Database [UniClassReservation]    Script Date: 15.05.2025 19:11:07 ******/
CREATE DATABASE [UniClassReservation]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniClassReservation', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UniClassReservation.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniClassReservation_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\UniClassReservation_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [UniClassReservation] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniClassReservation].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniClassReservation] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniClassReservation] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniClassReservation] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniClassReservation] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniClassReservation] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniClassReservation] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniClassReservation] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniClassReservation] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniClassReservation] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniClassReservation] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniClassReservation] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniClassReservation] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniClassReservation] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniClassReservation] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniClassReservation] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniClassReservation] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniClassReservation] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniClassReservation] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniClassReservation] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniClassReservation] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniClassReservation] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [UniClassReservation] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniClassReservation] SET RECOVERY FULL 
GO
ALTER DATABASE [UniClassReservation] SET  MULTI_USER 
GO
ALTER DATABASE [UniClassReservation] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniClassReservation] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniClassReservation] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniClassReservation] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniClassReservation] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UniClassReservation] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniClassReservation', N'ON'
GO
ALTER DATABASE [UniClassReservation] SET QUERY_STORE = ON
GO
ALTER DATABASE [UniClassReservation] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UniClassReservation]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Department] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Classrooms]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classrooms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Capacity] [int] NOT NULL,
	[Location] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[AverageRating] [float] NOT NULL,
	[FeedbackCount] [int] NOT NULL,
 CONSTRAINT [PK_Classrooms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[Rating] [int] NOT NULL,
	[ClassroomId] [int] NULL,
	[ClassroomName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[SeriesId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservations]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClassroomId] [int] NOT NULL,
	[TermId] [int] NOT NULL,
	[StartTime] [datetime2](7) NOT NULL,
	[EndTime] [datetime2](7) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[AdminNote] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reservations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Terms]    Script Date: 15.05.2025 19:11:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Terms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Terms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250510165006_InitialCreate', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250510194218_AddHolidayTable', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250510214257_AddFeedbackTable', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250510220911_AddFeedbackRating', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511090148_AddClassroomToFeedback', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511093409_ClassroomFeedbackFix2', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511094016_ClassroomAverageAndFeedbackCount', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511143408_AddDefaultUserRole', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250511172651_AddHolidaySeriesIdAndSoftDelete', N'9.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250514170734_RemoveUserRoleAndFields', N'9.0.4')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'31857fa5-8323-4c56-8521-715add25294f', N'Instructor', N'INSTRUCTOR', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'65a9a3a5-70a7-455c-b54f-b6adee174f45', N'User', N'USER', NULL)
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'e813bd85-4ce1-47b1-8c3d-2700d3f40c71', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c99c4c5d-fff9-4bea-9df6-1cc496086534', N'31857fa5-8323-4c56-8521-715add25294f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e7c82486-430d-444f-a7b2-b44877a38b7d', N'31857fa5-8323-4c56-8521-715add25294f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'31857fa5-8323-4c56-8521-715add25294f')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'819f5b8f-dcec-4d9c-84ee-8ffb79404efe', N'65a9a3a5-70a7-455c-b54f-b6adee174f45')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'c99c4c5d-fff9-4bea-9df6-1cc496086534', N'65a9a3a5-70a7-455c-b54f-b6adee174f45')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'71237c11-6717-4cf4-88d3-bd3e35f65d93', N'e813bd85-4ce1-47b1-8c3d-2700d3f40c71')
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'492120e0-91ec-42ec-b514-0c7a82ac5ff7', N'Deneme', N'Deneme', N'Deneme', CAST(N'2025-05-14T17:09:19.8040083' AS DateTime2), 0, N'deneme@gmail.com', N'DENEME@GMAIL.COM', N'deneme@gmail.com', N'DENEME@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEGYRD9y6uujG1vtBh/hbHIv71UF0LxeRlC2GkDfk0YP4+uz+q6UonLWrsu31ctuGJg==', N'AETTE6LZP32X3Q4IDT53ONISLNLZ4L3Q', N'94c7d513-2694-4221-a504-9e00a1540416', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'70d427e4-13c3-4bf2-8f94-f190111a4eef', N'deneme', N'deneme', N'deneme', CAST(N'2025-05-14T19:29:51.6674212' AS DateTime2), 0, N'deneme1@gmail.com', N'DENEME1@GMAIL.COM', N'deneme1@gmail.com', N'DENEME1@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEIs3m0FhZAuJGt0EdZxAeJmhwg9o/dYsNY9caWvxr55hMbQJrkhlXZ3PNkAYtAFl8g==', N'F35U3A5WZLELJAXJSCZX2XMZ5FDY5VOV', N'ffca365c-f56a-4a55-92e9-a0b64c189f41', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'71237c11-6717-4cf4-88d3-bd3e35f65d93', N'Admin', N'User', N'IT', CAST(N'2025-05-10T17:05:25.9837072' AS DateTime2), 1, N'admin@university.edu', N'ADMIN@UNIVERSITY.EDU', N'admin@university.edu', N'ADMIN@UNIVERSITY.EDU', 1, N'AQAAAAIAAYagAAAAECRkmrqHRuTDmb2R4UJQOyxTHku3q2tXiNbEKBXMKMmVddeVbnTeTwmB4x3NpuW0WA==', N'LC3LMSCSY7YKNRC3MV6EGPYKR5SQSMZQ', N'd7e4afb8-099a-40b8-8817-0f86a8fca9a7', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'819f5b8f-dcec-4d9c-84ee-8ffb79404efe', N'Elif', N'Ünsal', N'eczacılık', CAST(N'2025-05-11T15:42:35.9467315' AS DateTime2), 0, N'unsaleliif@gmail.com', N'UNSALELIIF@GMAIL.COM', N'unsaleliif@gmail.com', N'UNSALELIIF@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKIgrjWcqCiJ3vzfabPqpmeunyorpOH26kCurUZCCXFumDrSEanoQBpVewk/O7GKCw==', N'EBKJ4BSN56NYSV4CXMJZV4LFBHWQXOIT', N'3baf10f6-c89d-40ad-8d03-f3943e3e9f10', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'c99c4c5d-fff9-4bea-9df6-1cc496086534', N'Ibrahim', N'Ozdemir', N'CENG', CAST(N'2025-05-11T14:36:59.9291249' AS DateTime2), 1, N'ersanozdemir07@hotmail.com', N'ERSANOZDEMIR07@HOTMAIL.COM', N'ersanozdemir07@hotmail.com', N'ERSANOZDEMIR07@HOTMAIL.COM', 0, N'AQAAAAIAAYagAAAAEKkHwmKdGvRUR+By88ybsVUALgfhbiAtdQC0PQmH1/Ar8VTz1urf16uVDBGfDIXEPA==', N'6LHUW7FJEIDGKRPY5GUIFRUV4INRJ72L', N'07e97f7d-9c96-4a8f-bce7-c4f70a7ac918', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'e7c82486-430d-444f-a7b2-b44877a38b7d', N'İbrahim', N'Özdemir', N'CENG', CAST(N'2025-05-14T19:56:34.0402767' AS DateTime2), 1, N'deneme12@gmail.com', N'DENEME12@GMAIL.COM', N'deneme12@gmail.com', N'DENEME12@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAELDmclGWVD/AP+E70G7F1PYuGqTNLA3+10UhuHNlBIMb/glTi2wM7vuqJvl1OM/gBQ==', N'XXGYUZVXLV4W5ZLZGAE3YH2RYWIOXUNY', N'c8d182f6-6e2c-4794-ad9b-b58bf9d0100a', NULL, 0, 0, NULL, 1, 0)
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [Department], [CreatedAt], [IsActive], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim', N'Ersan', N'CENG', CAST(N'2025-05-10T18:23:23.4754435' AS DateTime2), 1, N'ersanozdemir0715@gmail.com', N'ERSANOZDEMIR0715@GMAIL.COM', N'ersanozdemir0715@gmail.com', N'ERSANOZDEMIR0715@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEIrqJQ8dBfaobrcFjor8xLDdAGJ8fzD9oVDeDK1gvPqdrxICTHR5Bip1NKmr3nvwPQ==', N'5NOJIBDTUHFJS5A6U2XVKXHUTOMEKTMW', N'2ad7afc2-cfaf-48d1-8bc8-9ba38f60a44d', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Classrooms] ON 

INSERT [dbo].[Classrooms] ([Id], [Name], [Capacity], [Location], [IsActive], [AverageRating], [FeedbackCount]) VALUES (2, N'ceng', 123, N'123', 0, 0, 0)
INSERT [dbo].[Classrooms] ([Id], [Name], [Capacity], [Location], [IsActive], [AverageRating], [FeedbackCount]) VALUES (3, N'CENG', 125, N'NA01', 1, 3.4166666666666665, 12)
INSERT [dbo].[Classrooms] ([Id], [Name], [Capacity], [Location], [IsActive], [AverageRating], [FeedbackCount]) VALUES (4, N'EE', 125, N'NA02', 1, 2.6666666666666665, 3)
SET IDENTITY_INSERT [dbo].[Classrooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (1, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'deneme deneme', CAST(N'2025-05-10T22:03:09.4507497' AS DateTime2), 1, 0, NULL, N'')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (2, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'DEeneme123', CAST(N'2025-05-11T09:04:28.7072067' AS DateTime2), 1, 4, NULL, N'')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (3, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'deneme', CAST(N'2025-05-11T09:35:16.8768528' AS DateTime2), 0, 2, 3, N'')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (4, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'deeee', CAST(N'2025-05-11T09:42:15.7252276' AS DateTime2), 1, 3, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (5, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'Deneme maili', CAST(N'2025-05-11T10:56:35.8070006' AS DateTime2), 0, 2, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (6, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'feedback', CAST(N'2025-05-11T12:15:52.9443154' AS DateTime2), 0, 5, 4, N'EE')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (7, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'Deneme feedbacki', CAST(N'2025-05-11T15:25:05.7441140' AS DateTime2), 0, 5, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (8, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'deneme feedback', CAST(N'2025-05-11T15:30:05.0734175' AS DateTime2), 0, 5, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (9, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'deneme feed', CAST(N'2025-05-11T15:34:40.3890462' AS DateTime2), 0, 4, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (10, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'çalııış', CAST(N'2025-05-11T15:37:37.6712444' AS DateTime2), 0, 4, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (11, N'819f5b8f-dcec-4d9c-84ee-8ffb79404efe', N'Elif Ünsal', N'>[', CAST(N'2025-05-11T15:50:38.0810731' AS DateTime2), 1, 1, NULL, N'')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (12, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'merhaba', CAST(N'2025-05-11T15:53:59.8307792' AS DateTime2), 0, 1, 4, N'EE')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (13, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'olll', CAST(N'2025-05-11T16:14:10.8077684' AS DateTime2), 0, 1, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (14, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'Deneme', CAST(N'2025-05-11T16:47:40.1023124' AS DateTime2), 0, 3, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (15, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'DEneme maili', CAST(N'2025-05-11T16:56:59.7086090' AS DateTime2), 1, 2, 4, N'EE')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (16, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'selam', CAST(N'2025-05-13T08:32:56.4255355' AS DateTime2), 0, 3, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (17, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'adsdsa', CAST(N'2025-05-13T08:44:10.7188129' AS DateTime2), 1, 4, 3, N'CENG')
INSERT [dbo].[Feedbacks] ([Id], [UserId], [UserName], [Message], [CreatedAt], [IsRead], [Rating], [ClassroomId], [ClassroomName]) VALUES (18, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', N'İbrahim Ersan', N'merhaba nasılsınız', CAST(N'2025-05-14T20:00:12.5394897' AS DateTime2), 0, 5, 3, N'CENG')
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[Holidays] ON 

INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (1, N'Yılbaşı', CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-01-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (2, N'Ulusal Egemenlik ve Çocuk Bayramı', CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-04-23T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (3, N'İşçi Bayramı', CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-01T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (4, N'Atatürk''ü Anma, Gençlik ve Spor Bayramı', CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-19T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (5, N'Demokrasi ve Millî Birlik Günü', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (6, N'Zafer Bayramı', CAST(N'2025-08-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-30T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (7, N'Cumhuriyet Bayramı', CAST(N'2025-10-29T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-29T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (8, N'Bayram', CAST(N'2025-03-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-03-17T00:00:00.0000000' AS DateTime2), 1, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (9, N'deneme (Monthly)', CAST(N'2025-05-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-16T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (10, N'deneme (Monthly)', CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-16T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (11, N'deneme (Monthly)', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (12, N'deneme (Monthly)', CAST(N'2025-08-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (13, N'deneme (Monthly)', CAST(N'2025-09-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-16T00:00:00.0000000' AS DateTime2), 0, NULL)
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (17, N'Bayram2 (Monthly)', CAST(N'2025-05-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (18, N'Bayram2 (Monthly)', CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (19, N'Bayram2 (Monthly)', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (20, N'Bayram2 (Monthly)', CAST(N'2025-08-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (21, N'Bayram2 (Monthly)', CAST(N'2025-09-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (22, N'Bayram2 (Monthly)', CAST(N'2025-10-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (23, N'Bayram2 (Monthly)', CAST(N'2025-11-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (24, N'Bayram2 (Monthly)', CAST(N'2025-12-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-07T00:00:00.0000000' AS DateTime2), 0, N'f98a73ff-f1c6-4353-bf48-e16670bf08e5')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (25, N'Deneme (Monthly)', CAST(N'2025-05-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (26, N'Deneme (Monthly)', CAST(N'2025-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (27, N'Deneme (Monthly)', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (28, N'Deneme (Monthly)', CAST(N'2025-08-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (29, N'Deneme (Monthly)', CAST(N'2025-09-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (30, N'Deneme (Monthly)', CAST(N'2025-10-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (31, N'Deneme (Monthly)', CAST(N'2025-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-01-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (32, N'Deneme (Monthly)', CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-02-06T00:00:00.0000000' AS DateTime2), 0, N'320c5c52-590c-40f7-862a-56ea42c9f1a1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (33, N'Deneme (Monthly)', CAST(N'2025-05-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-05-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (34, N'Deneme (Monthly)', CAST(N'2025-06-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-06-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (35, N'Deneme (Monthly)', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-07-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (36, N'Deneme (Monthly)', CAST(N'2025-08-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-08-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (37, N'Deneme (Monthly)', CAST(N'2025-09-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-09-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (38, N'Deneme (Monthly)', CAST(N'2025-10-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-10-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (39, N'Deneme (Monthly)', CAST(N'2025-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-11-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (40, N'Deneme (Monthly)', CAST(N'2025-12-05T00:00:00.0000000' AS DateTime2), CAST(N'2026-12-05T00:00:00.0000000' AS DateTime2), 0, N'dbc13afd-5620-4385-aaf3-08f999641f54')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (41, N'Deneme (Yearly)', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-04T00:00:00.0000000' AS DateTime2), 0, N'78488982-8e6c-4720-a210-2e631603b3da')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (42, N'Deneme (Yearly)', CAST(N'2026-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2026-05-04T00:00:00.0000000' AS DateTime2), 0, N'78488982-8e6c-4720-a210-2e631603b3da')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (43, N'Deneme (Yearly)', CAST(N'2027-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2027-05-04T00:00:00.0000000' AS DateTime2), 0, N'78488982-8e6c-4720-a210-2e631603b3da')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (44, N'Deneme (Yearly)', CAST(N'2028-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2028-05-04T00:00:00.0000000' AS DateTime2), 0, N'78488982-8e6c-4720-a210-2e631603b3da')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (45, N'Deneme (Yearly)', CAST(N'2029-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2029-05-04T00:00:00.0000000' AS DateTime2), 0, N'78488982-8e6c-4720-a210-2e631603b3da')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (46, N'deneme (Weekly)', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-04T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (47, N'deneme (Weekly)', CAST(N'2025-05-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-11T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (48, N'deneme (Weekly)', CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-18T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (49, N'deneme (Weekly)', CAST(N'2025-05-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-25T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (50, N'deneme (Weekly)', CAST(N'2025-05-31T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-01T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (51, N'deneme (Weekly)', CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-08T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (52, N'deneme (Weekly)', CAST(N'2025-06-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-15T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (53, N'deneme (Weekly)', CAST(N'2025-06-21T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-22T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (54, N'deneme (Weekly)', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (55, N'deneme (Weekly)', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (56, N'deneme (Weekly)', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (57, N'deneme (Weekly)', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (58, N'deneme (Weekly)', CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-27T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (59, N'deneme (Weekly)', CAST(N'2025-08-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (60, N'deneme (Weekly)', CAST(N'2025-08-09T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-10T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (61, N'deneme (Weekly)', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-17T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (62, N'deneme (Weekly)', CAST(N'2025-08-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-24T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (63, N'deneme (Weekly)', CAST(N'2025-08-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-31T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (64, N'deneme (Weekly)', CAST(N'2025-09-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-07T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (65, N'deneme (Weekly)', CAST(N'2025-09-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-14T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (66, N'deneme (Weekly)', CAST(N'2025-09-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-21T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (67, N'deneme (Weekly)', CAST(N'2025-09-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-28T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (68, N'deneme (Weekly)', CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-05T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (69, N'deneme (Weekly)', CAST(N'2025-10-11T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-12T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (70, N'deneme (Weekly)', CAST(N'2025-10-18T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-19T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (71, N'deneme (Weekly)', CAST(N'2025-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-26T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (72, N'deneme (Weekly)', CAST(N'2025-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-02T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (73, N'deneme (Weekly)', CAST(N'2025-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-09T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (74, N'deneme (Weekly)', CAST(N'2025-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-16T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (75, N'deneme (Weekly)', CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-23T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (76, N'deneme (Weekly)', CAST(N'2025-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-30T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (77, N'deneme (Weekly)', CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-07T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (78, N'deneme (Weekly)', CAST(N'2025-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-14T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (79, N'deneme (Weekly)', CAST(N'2025-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-21T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (80, N'deneme (Weekly)', CAST(N'2025-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-28T00:00:00.0000000' AS DateTime2), 0, N'13b0d5e6-6cb7-405f-b810-42013fbbb9f1')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (81, N'deneme (Weekly)', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (82, N'deneme (Weekly)', CAST(N'2025-05-10T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-10T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (83, N'deneme (Weekly)', CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-17T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (84, N'deneme (Weekly)', CAST(N'2025-05-24T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-24T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (85, N'deneme (Weekly)', CAST(N'2025-05-31T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-31T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (86, N'deneme (Weekly)', CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-07T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (87, N'deneme (Weekly)', CAST(N'2025-06-14T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-14T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (88, N'deneme (Weekly)', CAST(N'2025-06-21T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-21T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (89, N'deneme (Weekly)', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (90, N'deneme (Weekly)', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (91, N'deneme (Weekly)', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (92, N'deneme (Weekly)', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (93, N'deneme (Weekly)', CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-26T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (94, N'deneme (Weekly)', CAST(N'2025-08-02T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-02T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (95, N'deneme (Weekly)', CAST(N'2025-08-09T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-09T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (96, N'deneme (Weekly)', CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-16T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (97, N'deneme (Weekly)', CAST(N'2025-08-23T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-23T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (98, N'deneme (Weekly)', CAST(N'2025-08-30T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-30T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (99, N'deneme (Weekly)', CAST(N'2025-09-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-06T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (100, N'deneme (Weekly)', CAST(N'2025-09-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-13T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (101, N'deneme (Weekly)', CAST(N'2025-09-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-20T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (102, N'deneme (Weekly)', CAST(N'2025-09-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-27T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
GO
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (103, N'deneme (Weekly)', CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-04T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (104, N'deneme (Weekly)', CAST(N'2025-10-11T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-11T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (105, N'deneme (Weekly)', CAST(N'2025-10-18T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-18T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (106, N'deneme (Weekly)', CAST(N'2025-10-25T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-25T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (107, N'deneme (Weekly)', CAST(N'2025-11-01T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-01T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (108, N'deneme (Weekly)', CAST(N'2025-11-08T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-08T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (109, N'deneme (Weekly)', CAST(N'2025-11-15T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-15T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (110, N'deneme (Weekly)', CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-22T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (111, N'deneme (Weekly)', CAST(N'2025-11-29T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-29T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (112, N'deneme (Weekly)', CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-06T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (113, N'deneme (Weekly)', CAST(N'2025-12-13T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-13T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (114, N'deneme (Weekly)', CAST(N'2025-12-20T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-20T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (115, N'deneme (Weekly)', CAST(N'2025-12-27T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-27T00:00:00.0000000' AS DateTime2), 0, N'5b2df2fd-1ff6-4053-bb88-d3edeaee8fbd')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (116, N'Deneme (Monthly)', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (117, N'Deneme (Monthly)', CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (118, N'Deneme (Monthly)', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (119, N'Deneme (Monthly)', CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-08-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (120, N'Deneme (Monthly)', CAST(N'2025-09-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-09-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (121, N'Deneme (Monthly)', CAST(N'2025-10-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (122, N'Deneme (Monthly)', CAST(N'2025-11-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-11-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
INSERT [dbo].[Holidays] ([Id], [Name], [StartDate], [EndDate], [IsActive], [SeriesId]) VALUES (123, N'Deneme (Monthly)', CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-12-03T00:00:00.0000000' AS DateTime2), 1, N'c12246b7-1cbe-4aee-b077-0b1ff06edc3c')
SET IDENTITY_INSERT [dbo].[Holidays] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservations] ON 

INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (1, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2004-09-30T12:00:00.0000000' AS DateTime2), CAST(N'2004-10-30T12:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (2, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-12T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-12T13:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (4, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-26T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-26T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (5, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-02T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-02T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (6, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-09T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-09T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (7, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-16T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-16T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (8, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-23T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-23T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (9, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-30T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (10, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-07T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (11, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-14T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-14T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (12, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-21T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-21T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (13, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-28T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-28T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (14, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-04T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-04T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (15, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-11T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-11T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (16, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-18T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-18T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (17, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-25T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-25T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (18, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-01T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (19, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-08T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (20, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-15T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-15T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (21, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-22T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (22, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-29T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-29T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (23, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-06T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (24, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-13T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (25, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-20T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (26, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-27T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (27, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-03T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-03T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (28, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-10T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-10T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (29, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-17T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-17T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (30, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-24T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-24T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (31, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-01T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (32, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-08T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (33, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-15T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-15T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (34, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-22T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (35, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-29T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-29T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (36, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-05T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-05T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (37, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-12T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-12T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (38, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-19T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-19T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (39, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-26T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-26T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (40, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-02T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-02T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (41, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-09T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-09T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (42, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-16T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-16T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (43, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-23T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-23T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (44, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-02T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-02T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (45, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-09T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-09T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (46, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-16T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-16T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (47, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-23T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-23T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (48, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-30T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-30T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (49, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-06T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (50, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-13T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (51, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-20T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (52, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-27T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (53, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-04T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-04T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (54, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-11T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-11T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (55, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-18T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-18T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (56, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-25T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-25T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (57, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-01T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (58, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-08T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (59, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-15T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-15T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (60, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-22T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (61, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-29T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-29T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (62, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-06T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (63, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-13T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (64, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-20T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (65, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-27T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (66, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-03T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-03T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (67, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-10T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-10T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (68, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-17T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-17T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (69, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-24T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-24T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (70, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-31T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-31T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (71, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-07T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-07T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (72, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-14T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-14T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (73, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-21T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-21T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (74, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-28T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-28T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (75, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-05T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-05T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (76, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-12T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-12T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (77, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-19T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-19T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (78, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-26T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-26T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (79, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-02T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-02T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (80, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-09T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-09T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (81, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-16T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-16T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (82, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-23T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-23T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (83, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-30T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-30T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (84, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-07T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-07T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (85, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-14T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-14T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (86, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-21T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-21T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (87, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-28T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-28T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (88, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-04T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-04T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (89, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-11T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-11T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (90, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-18T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-18T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (91, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-25T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-25T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (92, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-01T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (93, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-08T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (94, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-15T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-15T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (95, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-22T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (96, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-01T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (97, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-08T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (98, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-15T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-15T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (99, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-22T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (100, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-29T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-29T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
GO
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (101, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-05T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-05T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (102, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-12T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-12T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (103, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-19T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-19T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (104, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-26T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-26T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (105, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-03T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-03T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (106, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-10T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-10T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (107, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-17T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-17T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (108, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-24T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-24T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (109, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-31T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-31T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (110, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-07T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-07T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (111, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-14T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-14T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (112, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-21T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-21T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (113, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-28T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-28T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (114, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-05T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-05T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (115, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-12T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-12T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (116, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-19T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-19T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (117, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-26T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-26T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (118, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-02T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-02T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (119, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-09T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-09T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (120, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-16T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-16T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (121, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-23T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-23T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (122, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-30T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-30T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (123, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-06T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (124, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-13T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (125, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-20T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (126, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-27T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (127, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-04T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-04T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (128, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-11T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-11T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (129, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-18T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-18T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (130, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-25T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-25T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (131, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-01T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-01T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (132, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-08T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-08T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (133, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-15T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-15T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (134, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-22T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-22T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (135, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-29T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-29T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (136, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-06T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (137, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-13T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (138, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-20T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (139, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-27T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (140, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-03T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-03T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (141, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-10T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-10T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (142, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-17T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-17T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (143, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-24T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-24T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (144, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-31T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-31T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (145, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-07T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-07T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (146, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-14T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-14T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (147, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-21T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-21T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (148, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-28T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-28T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (149, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-06T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-06T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (150, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-13T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-13T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (151, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-20T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-20T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (152, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-27T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-27T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (153, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-03T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-03T13:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (154, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-10T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-10T13:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (155, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-17T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-17T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (156, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-24T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-24T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (157, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-01T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-01T13:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (158, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-08T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-08T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (159, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-15T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-15T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (160, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-22T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-22T13:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (161, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-29T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-29T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (162, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-06-05T12:00:00.0000000' AS DateTime2), CAST(N'2028-06-05T13:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (163, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-12T13:00:00.0000000' AS DateTime2), CAST(N'2025-05-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (164, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 1, CAST(N'2025-06-03T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (166, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 1, CAST(N'2025-05-19T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-19T14:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (167, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 1, CAST(N'2025-05-05T13:00:00.0000000' AS DateTime2), CAST(N'2025-05-05T14:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (170, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 1, CAST(N'2025-05-19T15:00:00.0000000' AS DateTime2), CAST(N'2025-05-19T16:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (171, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 2, CAST(N'2025-07-15T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-15T15:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (174, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-03T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (175, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-10T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (176, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-17T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-17T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (177, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-24T12:00:00.0000000' AS DateTime2), CAST(N'2025-05-24T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (178, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-05-31T13:00:00.0000000' AS DateTime2), CAST(N'2025-05-31T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (179, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-07T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-07T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (180, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-14T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-14T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (181, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-21T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-21T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (182, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-06-28T13:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (183, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-05T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (184, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-12T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (185, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-19T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-19T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (186, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-07-26T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-26T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (187, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-02T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-02T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (188, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-09T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-09T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (189, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-16T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-16T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (190, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-08-23T12:00:00.0000000' AS DateTime2), CAST(N'2025-08-23T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (191, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-06T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (192, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-13T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (193, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-20T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (194, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-09-27T12:00:00.0000000' AS DateTime2), CAST(N'2025-09-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (195, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-04T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (196, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-11T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (197, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-18T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (198, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-10-25T12:00:00.0000000' AS DateTime2), CAST(N'2025-10-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (199, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-01T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-01T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (200, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-08T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-08T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (201, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-15T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-15T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (202, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-22T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-22T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (203, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-11-29T12:00:00.0000000' AS DateTime2), CAST(N'2025-11-29T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (204, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-06T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (205, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-13T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
GO
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (206, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-20T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (207, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2025-12-27T12:00:00.0000000' AS DateTime2), CAST(N'2025-12-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (208, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-03T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (209, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-10T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (210, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-17T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-17T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (211, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-24T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-24T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (212, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-01-31T12:00:00.0000000' AS DateTime2), CAST(N'2026-01-31T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (213, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-07T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-07T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (214, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-14T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-14T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (215, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-21T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-21T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (216, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-02-28T12:00:00.0000000' AS DateTime2), CAST(N'2026-02-28T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (217, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-07T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-07T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (218, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-14T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-14T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (219, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-21T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-21T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (220, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-03-28T12:00:00.0000000' AS DateTime2), CAST(N'2026-03-28T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (221, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-04T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (222, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-11T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (223, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-18T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (224, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-04-25T12:00:00.0000000' AS DateTime2), CAST(N'2026-04-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (225, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-02T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-02T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (226, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-09T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-09T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (227, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-16T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-16T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (228, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-23T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-23T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (229, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-05-30T12:00:00.0000000' AS DateTime2), CAST(N'2026-05-30T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (230, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-06T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (231, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-13T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (232, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-20T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (233, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-06-27T12:00:00.0000000' AS DateTime2), CAST(N'2026-06-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (234, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-04T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (235, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-11T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (236, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-18T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (237, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-07-25T12:00:00.0000000' AS DateTime2), CAST(N'2026-07-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (238, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-01T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-01T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (239, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-08T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-08T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (240, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-15T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-15T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (241, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-22T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-22T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (242, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-08-29T12:00:00.0000000' AS DateTime2), CAST(N'2026-08-29T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (243, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-05T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-05T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (244, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-12T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (245, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-19T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-19T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (246, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-09-26T12:00:00.0000000' AS DateTime2), CAST(N'2026-09-26T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (247, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-03T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (248, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-10T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (249, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-17T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-17T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (250, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-24T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-24T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (251, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-10-31T12:00:00.0000000' AS DateTime2), CAST(N'2026-10-31T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (252, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-07T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-07T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (253, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-14T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-14T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (254, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-21T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-21T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (255, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-11-28T12:00:00.0000000' AS DateTime2), CAST(N'2026-11-28T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (256, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-05T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-05T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (257, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-12T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (258, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-19T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-19T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (259, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2026-12-26T12:00:00.0000000' AS DateTime2), CAST(N'2026-12-26T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (260, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-02T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-02T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (261, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-09T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-09T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (262, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-16T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-16T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (263, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-23T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-23T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (264, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-01-30T12:00:00.0000000' AS DateTime2), CAST(N'2027-01-30T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (265, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-06T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (266, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-13T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (267, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-20T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (268, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-02-27T12:00:00.0000000' AS DateTime2), CAST(N'2027-02-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (269, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-06T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (270, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-13T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (271, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-20T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (272, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-03-27T12:00:00.0000000' AS DateTime2), CAST(N'2027-03-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (273, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-03T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (274, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-10T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (275, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-17T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-17T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (276, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-04-24T12:00:00.0000000' AS DateTime2), CAST(N'2027-04-24T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (277, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-01T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-01T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (278, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-08T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-08T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (279, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-15T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-15T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (280, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-22T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-22T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (281, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-05-29T12:00:00.0000000' AS DateTime2), CAST(N'2027-05-29T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (282, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-05T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-05T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (283, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-12T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (284, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-19T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-19T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (285, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-06-26T12:00:00.0000000' AS DateTime2), CAST(N'2027-06-26T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (286, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-03T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-03T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (287, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-10T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (288, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-17T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-17T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (289, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-24T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-24T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (290, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-07-31T12:00:00.0000000' AS DateTime2), CAST(N'2027-07-31T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (291, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-07T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-07T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (292, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-14T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-14T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (293, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-21T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-21T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (294, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-08-28T12:00:00.0000000' AS DateTime2), CAST(N'2027-08-28T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (295, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-04T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (296, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-11T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (297, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-18T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (298, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-09-25T12:00:00.0000000' AS DateTime2), CAST(N'2027-09-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (299, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-02T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-02T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (300, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-09T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-09T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (301, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-16T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-16T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (302, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-23T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-23T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (303, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-10-30T12:00:00.0000000' AS DateTime2), CAST(N'2027-10-30T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (304, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-06T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-06T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (305, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-13T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-13T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
GO
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (306, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-20T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-20T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (307, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-11-27T12:00:00.0000000' AS DateTime2), CAST(N'2027-11-27T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (308, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-04T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (309, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-11T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (310, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-18T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (311, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2027-12-25T12:00:00.0000000' AS DateTime2), CAST(N'2027-12-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (312, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-01T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-01T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (313, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-08T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-08T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (314, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-15T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-15T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (315, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-22T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-22T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (316, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-01-29T12:00:00.0000000' AS DateTime2), CAST(N'2028-01-29T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (317, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-05T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-05T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (318, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-12T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-12T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (319, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-19T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-19T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (320, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-02-26T12:00:00.0000000' AS DateTime2), CAST(N'2028-02-26T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (321, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-04T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-04T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (322, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-11T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-11T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (323, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-18T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-18T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (324, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-03-25T12:00:00.0000000' AS DateTime2), CAST(N'2028-03-25T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (325, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-01T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-01T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (326, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-08T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-08T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (327, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-15T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-15T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (328, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-22T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-22T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (329, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-04-29T12:00:00.0000000' AS DateTime2), CAST(N'2028-04-29T14:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (330, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-06T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-06T14:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (331, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-13T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-13T14:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (332, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-20T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-20T14:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (333, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-05-27T12:00:00.0000000' AS DateTime2), CAST(N'2028-05-27T14:00:00.0000000' AS DateTime2), N'Rejected', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (334, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 3, 1, CAST(N'2028-06-03T12:00:00.0000000' AS DateTime2), CAST(N'2028-06-03T14:00:00.0000000' AS DateTime2), N'Approved', NULL)
INSERT [dbo].[Reservations] ([Id], [UserId], [ClassroomId], [TermId], [StartTime], [EndTime], [Status], [AdminNote]) VALUES (335, N'ff850700-a3e5-4cdc-afe0-0ab9da7b477c', 4, 1, CAST(N'2025-05-10T13:00:00.0000000' AS DateTime2), CAST(N'2025-05-10T14:00:00.0000000' AS DateTime2), N'Pending', NULL)
SET IDENTITY_INSERT [dbo].[Reservations] OFF
GO
SET IDENTITY_INSERT [dbo].[Terms] ON 

INSERT [dbo].[Terms] ([Id], [Name], [StartDate], [EndDate], [IsActive]) VALUES (1, N'Yeni dönem', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2028-06-07T00:00:00.0000000' AS DateTime2), 0)
INSERT [dbo].[Terms] ([Id], [Name], [StartDate], [EndDate], [IsActive]) VALUES (2, N'Semester 1', CAST(N'2004-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2005-06-01T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Terms] ([Id], [Name], [StartDate], [EndDate], [IsActive]) VALUES (3, N'Kış', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2026-05-03T00:00:00.0000000' AS DateTime2), 1)
INSERT [dbo].[Terms] ([Id], [Name], [StartDate], [EndDate], [IsActive]) VALUES (4, N'Yaz', CAST(N'2025-05-03T00:00:00.0000000' AS DateTime2), CAST(N'2025-10-03T00:00:00.0000000' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Terms] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 15.05.2025 19:11:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 15.05.2025 19:11:07 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Feedbacks_ClassroomId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_Feedbacks_ClassroomId] ON [dbo].[Feedbacks]
(
	[ClassroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_ClassroomId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_ClassroomId] ON [dbo].[Reservations]
(
	[ClassroomId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Reservations_TermId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_TermId] ON [dbo].[Reservations]
(
	[TermId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Reservations_UserId]    Script Date: 15.05.2025 19:11:07 ******/
CREATE NONCLUSTERED INDEX [IX_Reservations_UserId] ON [dbo].[Reservations]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Classrooms] ADD  DEFAULT ((0.0000000000000000e+000)) FOR [AverageRating]
GO
ALTER TABLE [dbo].[Classrooms] ADD  DEFAULT ((0)) FOR [FeedbackCount]
GO
ALTER TABLE [dbo].[Feedbacks] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Feedbacks] ADD  DEFAULT (N'') FOR [ClassroomName]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Classrooms_ClassroomId] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[Classrooms] ([Id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Classrooms_ClassroomId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Classrooms_ClassroomId] FOREIGN KEY([ClassroomId])
REFERENCES [dbo].[Classrooms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Classrooms_ClassroomId]
GO
ALTER TABLE [dbo].[Reservations]  WITH CHECK ADD  CONSTRAINT [FK_Reservations_Terms_TermId] FOREIGN KEY([TermId])
REFERENCES [dbo].[Terms] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Reservations] CHECK CONSTRAINT [FK_Reservations_Terms_TermId]
GO
USE [master]
GO
ALTER DATABASE [UniClassReservation] SET  READ_WRITE 
GO

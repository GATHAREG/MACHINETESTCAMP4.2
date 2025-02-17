USE [master]
GO
/****** Object:  Database [airline_db]    Script Date: 28-08-2024 16:09:38 ******/
CREATE DATABASE [airline_db]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'airline_db', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\airline_db.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'airline_db_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\airline_db_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [airline_db] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [airline_db].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [airline_db] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [airline_db] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [airline_db] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [airline_db] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [airline_db] SET ARITHABORT OFF 
GO
ALTER DATABASE [airline_db] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [airline_db] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [airline_db] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [airline_db] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [airline_db] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [airline_db] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [airline_db] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [airline_db] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [airline_db] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [airline_db] SET  ENABLE_BROKER 
GO
ALTER DATABASE [airline_db] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [airline_db] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [airline_db] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [airline_db] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [airline_db] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [airline_db] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [airline_db] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [airline_db] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [airline_db] SET  MULTI_USER 
GO
ALTER DATABASE [airline_db] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [airline_db] SET DB_CHAINING OFF 
GO
ALTER DATABASE [airline_db] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [airline_db] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [airline_db] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [airline_db] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [airline_db] SET QUERY_STORE = OFF
GO
USE [airline_db]
GO
/****** Object:  Table [dbo].[AIRPORT]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AIRPORT](
	[AirportId] [int] NOT NULL,
	[AirportName] [nvarchar](30) NULL,
	[City] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[AirportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight](
	[FlightId] [int] NOT NULL,
	[FlightName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_Arrival]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_Arrival](
	[FlightArrivalId] [int] IDENTITY(300,1) NOT NULL,
	[FlightId] [int] NULL,
	[AirportId] [int] NULL,
	[ScheduleId] [int] NULL,
	[FlightDepartureId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightArrivalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flight_departure]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flight_departure](
	[FlightDepatureId] [int] IDENTITY(200,1) NOT NULL,
	[FlightId] [int] NULL,
	[AirportId] [int] NULL,
	[ScheduleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FlightDepatureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] NOT NULL,
	[RoleName] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[ScheduleId] [int] NOT NULL,
	[DateOfTravel] [date] NOT NULL,
	[TimeOfTravel] [time](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ScheduleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](30) NULL,
	[Password] [nvarchar](8) NULL,
	[RoleId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AIRPORT] ([AirportId], [AirportName], [City]) VALUES (150, N'Trivandrum IN', N'Trivandrum')
INSERT [dbo].[AIRPORT] ([AirportId], [AirportName], [City]) VALUES (151, N'Kochi IN', N'Kakkanad')
INSERT [dbo].[AIRPORT] ([AirportId], [AirportName], [City]) VALUES (152, N'Mumbai IN', N'Mumbai')
INSERT [dbo].[AIRPORT] ([AirportId], [AirportName], [City]) VALUES (153, N'Kolkata IN', N'kolkata')
INSERT [dbo].[AIRPORT] ([AirportId], [AirportName], [City]) VALUES (154, N'Chandrashekar IN', N'Bangalore')
GO
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (100, N'British Airways')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (101, N'American Express')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (102, N'Air India')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (103, N'KingFisher')
INSERT [dbo].[Flight] ([FlightId], [FlightName]) VALUES (104, N'Japan Airland')
GO
INSERT [dbo].[Roles] ([RoleId], [RoleName]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Schedule] ([ScheduleId], [DateOfTravel], [TimeOfTravel]) VALUES (50, CAST(N'2024-08-28' AS Date), CAST(N'12:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleId], [DateOfTravel], [TimeOfTravel]) VALUES (51, CAST(N'2024-08-28' AS Date), CAST(N'14:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleId], [DateOfTravel], [TimeOfTravel]) VALUES (52, CAST(N'2024-08-29' AS Date), CAST(N'23:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleId], [DateOfTravel], [TimeOfTravel]) VALUES (53, CAST(N'2024-08-29' AS Date), CAST(N'02:00:00' AS Time))
INSERT [dbo].[Schedule] ([ScheduleId], [DateOfTravel], [TimeOfTravel]) VALUES (54, CAST(N'2024-08-29' AS Date), CAST(N'16:00:00' AS Time))
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (1, N'Gatha', N'Gath@123', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (2, N'Merin', N'Meri@123', 1)
INSERT [dbo].[Users] ([UserId], [Username], [Password], [RoleId]) VALUES (3, N'Remya', N'Rem@123', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Flight_Arrival]  WITH CHECK ADD FOREIGN KEY([AirportId])
REFERENCES [dbo].[AIRPORT] ([AirportId])
GO
ALTER TABLE [dbo].[Flight_Arrival]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Flight_Arrival]  WITH CHECK ADD FOREIGN KEY([FlightDepartureId])
REFERENCES [dbo].[Flight_departure] ([FlightDepatureId])
GO
ALTER TABLE [dbo].[Flight_Arrival]  WITH CHECK ADD FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[Flight_departure]  WITH CHECK ADD FOREIGN KEY([AirportId])
REFERENCES [dbo].[AIRPORT] ([AirportId])
GO
ALTER TABLE [dbo].[Flight_departure]  WITH CHECK ADD FOREIGN KEY([FlightId])
REFERENCES [dbo].[Flight] ([FlightId])
GO
ALTER TABLE [dbo].[Flight_departure]  WITH CHECK ADD FOREIGN KEY([ScheduleId])
REFERENCES [dbo].[Schedule] ([ScheduleId])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
/****** Object:  StoredProcedure [dbo].[AddFlightArr]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create  procedure [dbo].[AddFlightArr](
           @FlightId INT,
		   @AirportId INT,
		   @ScheduleID INT,
		   @FlightDepatureId INT
		   )
AS
BEGIN
  
    INSERT INTO Flight_Arrival ( FlightId, AirportId ,ScheduleId,FlightDepartureId)VALUES(@FlightId,@AirportId,@ScheduleID,@FlightDepatureId);
 End;
GO
/****** Object:  StoredProcedure [dbo].[AddFlightDept]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddFlightDept](
        
           @FlightId INT,
		   @AirportId INT,
		   @ScheduleID INT
)
AS
begin
INSERT INTO Flight_departure( FlightId, AirportId ,ScheduleId)VALUES(@FlightId,@AirportId,@ScheduleID);
END;
GO
/****** Object:  StoredProcedure [dbo].[AirportShow]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AirportShow]
as
begin
   select * from AIRPORT;
end;
GO
/****** Object:  StoredProcedure [dbo].[FlightShow]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FlightShow]
as
begin
   select * from Flight;
end;
GO
/****** Object:  StoredProcedure [dbo].[Scheduleshow]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[Scheduleshow]
as
begin
 select * from Schedule;
end;
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetUserPassword]    Script Date: 28-08-2024 16:09:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_GetUserPassword](
               @Username Nvarchar(30),
			   @Password NVARCHAR(8),
			   @RoleId int output
)
AS
BEGIN
    SELECT @RoleId = RoleId FROM Users WHERE Username = @Username AND Password=@Password;
End;
GO
USE [master]
GO
ALTER DATABASE [airline_db] SET  READ_WRITE 
GO

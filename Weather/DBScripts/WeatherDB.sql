USE [master]
GO
/****** Object:  Database [WeatherDB]    Script Date: 06/06/2021 10:35:26 pm ******/
CREATE DATABASE [WeatherDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Weather', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Weather.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Weather_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Weather_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [WeatherDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WeatherDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WeatherDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WeatherDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WeatherDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WeatherDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WeatherDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WeatherDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WeatherDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WeatherDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WeatherDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WeatherDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WeatherDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WeatherDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WeatherDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WeatherDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WeatherDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WeatherDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WeatherDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WeatherDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WeatherDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WeatherDB] SET  MULTI_USER 
GO
ALTER DATABASE [WeatherDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WeatherDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WeatherDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WeatherDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WeatherDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [WeatherDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [WeatherDB] SET QUERY_STORE = OFF
GO
USE [WeatherDB]
GO
/****** Object:  Table [dbo].[Weather]    Script Date: 06/06/2021 10:35:26 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weather](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](256) NOT NULL,
	[TempDate] [date] NULL,
	[TempTime] [time](7) NULL,
	[Temperature] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeatherHistory]    Script Date: 06/06/2021 10:35:26 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeatherHistory](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](256) NULL,
	[TempDate] [date] NULL,
	[TempTime] [time](7) NULL,
	[Temperature] [float] NULL,
	[weatherId] [int] NULL,
 CONSTRAINT [PK_WeatherHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Weather] ON 

INSERT [dbo].[Weather] ([Id], [CityName], [TempDate], [TempTime], [Temperature]) VALUES (2, N'multan', CAST(N'2021-05-20' AS Date), CAST(N'11:20:16.1120000' AS Time), 55)
INSERT [dbo].[Weather] ([Id], [CityName], [TempDate], [TempTime], [Temperature]) VALUES (3, N'Karachi', CAST(N'2021-05-19' AS Date), CAST(N'18:21:03.6940000' AS Time), 39)
INSERT [dbo].[Weather] ([Id], [CityName], [TempDate], [TempTime], [Temperature]) VALUES (1008, N'Lahore', CAST(N'2021-05-20' AS Date), CAST(N'10:49:00.0780000' AS Time), 32)
INSERT [dbo].[Weather] ([Id], [CityName], [TempDate], [TempTime], [Temperature]) VALUES (1012, N'string', CAST(N'2021-05-21' AS Date), CAST(N'06:11:41.4940000' AS Time), 0)
INSERT [dbo].[Weather] ([Id], [CityName], [TempDate], [TempTime], [Temperature]) VALUES (2006, N'Chitral', CAST(N'2021-06-04' AS Date), CAST(N'13:52:35.4470000' AS Time), 12)
SET IDENTITY_INSERT [dbo].[Weather] OFF
GO
SET IDENTITY_INSERT [dbo].[WeatherHistory] ON 

INSERT [dbo].[WeatherHistory] ([Id], [CityName], [TempDate], [TempTime], [Temperature], [weatherId]) VALUES (2, N'Multan', CAST(N'2021-05-19' AS Date), CAST(N'18:18:23.4490000' AS Time), 45, 2)
INSERT [dbo].[WeatherHistory] ([Id], [CityName], [TempDate], [TempTime], [Temperature], [weatherId]) VALUES (3, N'multan', CAST(N'2021-05-20' AS Date), CAST(N'05:45:25.2740000' AS Time), 38, 2)
INSERT [dbo].[WeatherHistory] ([Id], [CityName], [TempDate], [TempTime], [Temperature], [weatherId]) VALUES (1003, N'Lahore', CAST(N'2021-05-20' AS Date), CAST(N'10:42:15.7170000' AS Time), 45, 1006)
INSERT [dbo].[WeatherHistory] ([Id], [CityName], [TempDate], [TempTime], [Temperature], [weatherId]) VALUES (1004, N'multan', CAST(N'2021-05-20' AS Date), CAST(N'06:06:07.8950000' AS Time), 50, 2)
SET IDENTITY_INSERT [dbo].[WeatherHistory] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [cityname_unique]    Script Date: 06/06/2021 10:35:26 pm ******/
ALTER TABLE [dbo].[Weather] ADD  CONSTRAINT [cityname_unique] UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Weather__886159E5D2FD2040]    Script Date: 06/06/2021 10:35:26 pm ******/
ALTER TABLE [dbo].[Weather] ADD UNIQUE NONCLUSTERED 
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SPWeatherInformation]    Script Date: 06/06/2021 10:35:26 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SPWeatherInformation]
@WeatherID int
As
BEGIN
	select W.id,w.CityName from weather W
	inner join WeatherHistory Wh on W.Id=Wh.weatherId
	Where w.Id=@WeatherID
End
GO
USE [master]
GO
ALTER DATABASE [WeatherDB] SET  READ_WRITE 
GO

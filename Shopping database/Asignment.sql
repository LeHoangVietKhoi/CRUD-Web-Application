USE [master]
GO
/****** Object:  Database [Account]    Script Date: 7/15/2020 5:22:17 PM ******/
CREATE DATABASE [Account]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Account', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Account.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Account_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Account_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Account] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Account].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Account] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Account] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Account] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Account] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Account] SET ARITHABORT OFF 
GO
ALTER DATABASE [Account] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Account] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Account] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Account] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Account] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Account] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Account] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Account] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Account] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Account] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Account] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Account] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Account] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Account] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Account] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Account] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Account] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Account] SET RECOVERY FULL 
GO
ALTER DATABASE [Account] SET  MULTI_USER 
GO
ALTER DATABASE [Account] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Account] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Account] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Account] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Account] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Account', N'ON'
GO
ALTER DATABASE [Account] SET QUERY_STORE = OFF
GO
USE [Account]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/15/2020 5:22:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL,
	[role] [bit] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/15/2020 5:22:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[productName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[productName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [lastname], [role]) VALUES (N'chipheo', N'logachcu', N'Thi No', 0)
INSERT [dbo].[Account] ([username], [password], [lastname], [role]) VALUES (N'laohac', N'cauvang', N'Nam Cao', 1)
INSERT [dbo].[Account] ([username], [password], [lastname], [role]) VALUES (N'luyen', N'tutuchethhddd', N'Chi Hoa', 0)
GO
INSERT [dbo].[product] ([productName]) VALUES (N'Ca')
INSERT [dbo].[product] ([productName]) VALUES (N'Ca voi')
INSERT [dbo].[product] ([productName]) VALUES (N'Cho')
INSERT [dbo].[product] ([productName]) VALUES (N'Ga')
INSERT [dbo].[product] ([productName]) VALUES (N'Heo')
INSERT [dbo].[product] ([productName]) VALUES (N'Ho')
INSERT [dbo].[product] ([productName]) VALUES (N'Meo')
INSERT [dbo].[product] ([productName]) VALUES (N'Tho')
GO
USE [master]
GO
ALTER DATABASE [Account] SET  READ_WRITE 
GO

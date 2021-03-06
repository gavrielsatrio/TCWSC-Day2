USE [master]
GO
/****** Object:  Database [TCWSC-Day2-ModuleWeb]    Script Date: 15/12/2020 19:33:19 ******/
CREATE DATABASE [TCWSC-Day2-ModuleWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TCWSC-Day2-ModuleWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.GAVRIEL\MSSQL\DATA\TCWSC-Day2-ModuleWeb.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TCWSC-Day2-ModuleWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.GAVRIEL\MSSQL\DATA\TCWSC-Day2-ModuleWeb_log.ldf' , SIZE = 3136KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TCWSC-Day2-ModuleWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET  MULTI_USER 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET QUERY_STORE = OFF
GO
USE [TCWSC-Day2-ModuleWeb]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 15/12/2020 19:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [varchar](36) NOT NULL,
	[ParentId] [varchar](36) NULL,
	[Name] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15/12/2020 19:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [varchar](36) NOT NULL,
	[SellerId] [varchar](36) NOT NULL,
	[CategoryId] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Price] [int] NOT NULL,
	[Stock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15/12/2020 19:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](200) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[Role] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 15/12/2020 19:33:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[Id] [varchar](36) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[ActiveAt] [datetime] NULL,
	[ExpiresAt] [datetime] NULL,
	[ApplicableItems] [text] NULL,
	[Unit] [varchar](50) NOT NULL,
	[Amount] [float] NOT NULL,
	[Quota] [int] NULL,
	[Code] [varchar](255) NOT NULL,
	[MaxMonetary] [float] NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'04ed2bd9-8e83-44e5-9d79-494324ec862d', N'735c847f-9a33-442b-a57b-9ec943589025', N'Vitamin')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'2f65e8e4-61ea-4536-b0eb-df39fa9104df', NULL, N'Food & Beverage')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'3690a133-0d94-4ec4-9d5c-6805da46974d', N'735c847f-9a33-442b-a57b-9ec943589025', N'Mask')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'6c7f6ae1-9e72-4067-a4ef-4d59fd534ce4', N'2f65e8e4-61ea-4536-b0eb-df39fa9104df', N'Ready to Cook')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'735c847f-9a33-442b-a57b-9ec943589025', NULL, N'Kesehatan')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'9b805157-e531-451d-a45b-e2f842cb9eb1', NULL, N'Elektronik')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'a4bdbaf4-f4e2-4923-b7b2-f2fdbdbb6eb6', N'9b805157-e531-451d-a45b-e2f842cb9eb1', N'Audio')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'b02d7e57-419a-4d09-836f-99762c75af53', N'9b805157-e531-451d-a45b-e2f842cb9eb1', N'Tablet')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'b515f094-67ec-4872-8c87-e245d2e1c040', N'2f65e8e4-61ea-4536-b0eb-df39fa9104df', N'Snack')
INSERT [dbo].[Categories] ([Id], [ParentId], [Name]) VALUES (N'e052b21d-f5a6-4685-b1b3-f874dc24f120', N'9b805157-e531-451d-a45b-e2f842cb9eb1', N'Handphone')
GO
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Role]) VALUES (N'admin1', N'Admin', N'admin@gmail.com', N'admin123', N'Admin')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Role]) VALUES (N'barubaru1', N'barubaru', N'baru@gmail.com', N'baru123.', N'User')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Role]) VALUES (N'seller1', N'Seller', N'seller@gmail.com', N'seller123', N'Seller')
INSERT [dbo].[Users] ([Id], [Name], [Email], [Password], [Role]) VALUES (N'user1', N'Gavriel Satrio Widjaya', N'gav123@gmail.com', N'user123', N'User')
GO
INSERT [dbo].[Vouchers] ([Id], [Name], [ActiveAt], [ExpiresAt], [ApplicableItems], [Unit], [Amount], [Quota], [Code], [MaxMonetary]) VALUES (N'36974cfb-b858-464d-b5f7-2f675fa90f3f', N'Food Voucher 12.12', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T00:00:00.000' AS DateTime), N'[{\"id\": \"1\", \"type\": \"category\"}]', N'monetary', 12000, 100, N'1212ALL', NULL)
INSERT [dbo].[Vouchers] ([Id], [Name], [ActiveAt], [ExpiresAt], [ApplicableItems], [Unit], [Amount], [Quota], [Code], [MaxMonetary]) VALUES (N'7e36bae0-6294-4f81-85b3-68dfbfd69b36', N'Voucher Belanja 12.12', CAST(N'2020-12-12T00:00:00.000' AS DateTime), CAST(N'2020-12-13T00:00:00.000' AS DateTime), NULL, N'percent', 12, 100, N'1212FOOD', NULL)
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Products] NOCHECK CONSTRAINT [FK_Products_Categories]
GO
ALTER TABLE [dbo].[Products]  WITH NOCHECK ADD  CONSTRAINT [FK_Products_Products] FOREIGN KEY([SellerId])
REFERENCES [dbo].[Users] ([Id])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Products] NOCHECK CONSTRAINT [FK_Products_Products]
GO
USE [master]
GO
ALTER DATABASE [TCWSC-Day2-ModuleWeb] SET  READ_WRITE 
GO

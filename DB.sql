USE [master]
GO
/****** Object:  Database [OrganicAtelier]    Script Date: 14.05.2024 11:38:57 ******/
CREATE DATABASE [OrganicAtelier]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'OrganicAtelier', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OrganicAtelier.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'OrganicAtelier_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\OrganicAtelier_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [OrganicAtelier] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [OrganicAtelier].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [OrganicAtelier] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [OrganicAtelier] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [OrganicAtelier] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [OrganicAtelier] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [OrganicAtelier] SET ARITHABORT OFF 
GO
ALTER DATABASE [OrganicAtelier] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [OrganicAtelier] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [OrganicAtelier] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [OrganicAtelier] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [OrganicAtelier] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [OrganicAtelier] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [OrganicAtelier] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [OrganicAtelier] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [OrganicAtelier] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [OrganicAtelier] SET  ENABLE_BROKER 
GO
ALTER DATABASE [OrganicAtelier] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [OrganicAtelier] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [OrganicAtelier] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [OrganicAtelier] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [OrganicAtelier] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [OrganicAtelier] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [OrganicAtelier] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [OrganicAtelier] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [OrganicAtelier] SET  MULTI_USER 
GO
ALTER DATABASE [OrganicAtelier] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [OrganicAtelier] SET DB_CHAINING OFF 
GO
ALTER DATABASE [OrganicAtelier] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [OrganicAtelier] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [OrganicAtelier] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [OrganicAtelier] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [OrganicAtelier] SET QUERY_STORE = ON
GO
ALTER DATABASE [OrganicAtelier] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [OrganicAtelier]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 14.05.2024 11:38:58 ******/
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
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 14.05.2024 11:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 14.05.2024 11:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Weight] [decimal](18, 2) NOT NULL,
	[Unit] [decimal](18, 2) NOT NULL,
	[Image] [nvarchar](200) NULL,
	[Type] [nvarchar](10) NULL,
	[ProductTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 14.05.2024 11:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ProductTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 14.05.2024 11:38:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[ImageUrl1] [nvarchar](max) NULL,
	[ImageUrl2] [nvarchar](max) NULL,
	[Page] [nvarchar](30) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240509072810_CreateDatabase', N'8.0.4')
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (1, N'Organik olarak yetiştirilen, üretiminde hiçbir ilaç ve kimyasal kullanılmayan, üreticisinden verilmiş öneri ile içi kadar dış kabuklarını da değerlendirilebileceğiniz sıkmalık portakal, hiçbir kimyasala maruz kalmadan topraktan sofranıza ulaşıyor.', CAST(24.90 AS Decimal(18, 2)), 3)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (2, N'Kimyasal katkı barındırmayan, tat yoğunluğu yüksek ve aroma kalitesi bakımından oldukça zengin olan yerli muz, Organic Atelier tarafından organik tarım esaslarına bağlı kalınarak üretilmektedir.', CAST(64.90 AS Decimal(18, 2)), 5)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (3, N'Yeşil zemin üzerinde hafif donuk tonlarına sahip olan Granny Smith elma, sert yapısı, ekşiliği ve bol sulu olma özelliği ile ön plana çıkmaktadır.', CAST(42.90 AS Decimal(18, 2)), 7)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (4, N'Kıpkırmızı rengi ve lezzetli aroması ile bilinen Scarlet elma, Organic Atelier ile meyve tabaklarınıza ulaşıyor.', CAST(34.90 AS Decimal(18, 2)), 6)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (5, N'Evet mis gibi çilek. Hiç merak etmeyin; ne hormonlu, ne GDO’lu ne de pestisitli. Diğer meyve ve sebzelerimizden hiçbir farkı yok.', CAST(59.90 AS Decimal(18, 2)), 8)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (6, N'Bütün dünyada misafirperverliğin sembolü olarak bilinen ananas dolu dolu içeriğiyle mucizevi bir meyve olarak görülmektedir. Demir, kalsiyum, A, B ve C vitaminleri yanı sıra, lif bakımından zengindir. ', CAST(99.90 AS Decimal(18, 2)), 10)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (7, N'Erken mevsimde hasat edilen yatak limonlar, esnek ve ince kabuklu dinlenmiş limon olarak Organic Atelier''de!', CAST(24.90 AS Decimal(18, 2)), 12)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (8, N'Salatası, çorbası, mezesi, kızartması ya da o çok sevilen tarator mu desek bilemedik. ', CAST(44.90 AS Decimal(18, 2)), 13)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (9, N'İnce ince kıyılmış hali ile her yemeğin başlangıcı olan soğanı, halka halka dilimleyip fırın yemeklerine katabilir, yarım ay şeklinde doğrayarak salatada, piyazda tercih edebilirsiniz. ', CAST(17.90 AS Decimal(18, 2)), 14)
INSERT [dbo].[ProductDetail] ([Id], [Description], [Price], [ProductId]) VALUES (11, N'Adı da tadı da bir başka, yemeğe doyulmaz organik köy domatesi! En sevilen sebzelerde başı çeken domatesinizi sabah - akşam demeden günün her vaktinde tüketebilir, isteğinize göre onunla pratik ve lezzetli tarifler oluşturabilirsiniz.', CAST(54.90 AS Decimal(18, 2)), 15)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (3, N'Portakal Sıkmalık', CAST(24.90 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-1.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (5, N'Organik Yerli Muz', CAST(64.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-2.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (6, N'Elma Scarlet', CAST(34.90 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-3.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (7, N'Elma Granny', CAST(42.90 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-4.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (8, N'Organik Çilek', CAST(59.90 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-5.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (10, N'Ananas', CAST(99.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-6.jpg', N'Meyve', 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (12, N'Organik Yatak Limon', CAST(24.90 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-7.jpg', N'Sebze', 2)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (13, N'Organik Havuç', CAST(44.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-8.jpg', N'Sebze', 2)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (14, N'Organik Kuru Soğan', CAST(17.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-9.jpg', N'Sebze', 2)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId]) VALUES (15, N'Organik Köy Domatesi', CAST(54.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-10.jpg', N'Sebze', 2)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (1, N'Meyve', 1)
INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (2, N'Sebze', 1)
INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (3, N'Yeşillikler ve Otlar', 1)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
/****** Object:  Index [IX_ProductDetail_ProductId]    Script Date: 14.05.2024 11:38:58 ******/
CREATE NONCLUSTERED INDEX [IX_ProductDetail_ProductId] ON [dbo].[ProductDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 14.05.2024 11:38:58 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetail_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK_ProductDetail_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_ProductTypes_ProductTypeId] FOREIGN KEY([ProductTypeId])
REFERENCES [dbo].[ProductTypes] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_ProductTypes_ProductTypeId]
GO
USE [master]
GO
ALTER DATABASE [OrganicAtelier] SET  READ_WRITE 
GO

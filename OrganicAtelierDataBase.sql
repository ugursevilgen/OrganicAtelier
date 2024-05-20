USE [master]
GO
/****** Object:  Database [OrganicAtelier]    Script Date: 20.05.2024 11:22:58 ******/
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
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 20.05.2024 11:22:58 ******/
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
/****** Object:  Table [dbo].[Abouts]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Abouts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](200) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Abouts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Text] [nvarchar](2000) NULL,
	[Writer] [nvarchar](200) NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[Comment] [nvarchar](2000) NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](200) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](13) NULL,
	[Email] [nvarchar](300) NULL,
	[Location] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Facebook] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
	[LinkedIn] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employments]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Employments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Features]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Features](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](300) NULL,
	[ImageUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Features] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_ProductDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 20.05.2024 11:22:58 ******/
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
	[IsPopular] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 20.05.2024 11:22:58 ******/
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
/****** Object:  Table [dbo].[Sliders]    Script Date: 20.05.2024 11:22:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title2] [nvarchar](100) NULL,
	[Description2] [nvarchar](200) NULL,
	[ImageUrl1] [nvarchar](max) NULL,
	[ImageUrl2] [nvarchar](max) NULL,
	[Page] [nvarchar](30) NULL,
	[Description1] [nvarchar](200) NULL,
	[Title1] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240509072810_CreateDatabase', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240515075159_Updatedb', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240516081917_SliderUpdate', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517080356_about', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517093035_employment', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517111956_emplo', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517112627_Emplo', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517112832_Emplo', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517121515_client', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517195645_feature', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240517200720_revize_feature', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240518070047_BlogCreate', N'8.0.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240519110734_Contact', N'8.0.4')
GO
SET IDENTITY_INSERT [dbo].[Abouts] ON 

INSERT [dbo].[Abouts] ([Id], [Title], [Description], [Image]) VALUES (5, N'Biz Kimiz?', N'Organik Atelier profesyonellerin yönettiği, kurumsallığı hedeflemiş bir firmadır. Gücünü, kurucu ortaklarının ve çalışanlarının "doğa” ve "insan” sevgisinden alır.', N'about.jpg')
SET IDENTITY_INSERT [dbo].[Abouts] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([Id], [Title], [ImageUrl], [Text], [Writer], [Date]) VALUES (1, N'Sürdürülebilirlik Nedir?', N'blog-1.jpg', N'Sürdürülebilirlik, genellikle gelecek nesillerin kendi ihtiyaçlarını karşılama kabiliyetinden ödün vermeden kendi ihtiyaçlarımızı karşılamak olarak tanımlanır. Kaynakların sınırlı olduğunun bilinmesi esastır. Ayrıca kaynakların kullanılma biçimlerinin uzun vadeli sonuçlarının da akıllıca değerlendirilmesi gerekir.', N'Uğur Sevilgen', CAST(N'1996-07-09T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Blogs] ([Id], [Title], [ImageUrl], [Text], [Writer], [Date]) VALUES (3, N'Organik Tarım Nasıl Yapılır?', N'blog-2.jpg', N'Organik tarım yapılması için öncelikle arazinin belirli özelliklere sahip olması gerekir. Arazinin çöp depolama alanlarından, canlıların sağlığı üzerinde olumsuz etkiler bırakabilecek maddeler içeren akarsulardan ve yer altı sularından uzak olması gerekir. Aynı zamanda yakın çevrede işlek anayollar ve maden işletmeleri de olmamalıdır.', N'Fırat Pekgöz', CAST(N'2023-10-10T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Blogs] ([Id], [Title], [ImageUrl], [Text], [Writer], [Date]) VALUES (4, N'Nelere Dikkat Edilmelidir?', N'blog-3.jpg', N'Organik tarım yaparken dikkat edilmesi gereken önemli noktalar şu şekilde sıralanabilir:

Toprağa zarar verebilecek kimyasal maddelerin kullanılmaması
Genetiği değiştirilmiş tohumlardan uzak durulması
Zararlılar ve hastalıklarla mücadele ederken doğaya zarar veren kalıcı kimyasal maddeler kullanılmaması
Ürünlerin sertifikasyonunun ve etiketlendirmesinin yapılması', N'Ege Yüksel', CAST(N'2022-11-22T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([Id], [Title], [Name], [ImageUrl], [Comment]) VALUES (1, N'Tamamen Doğal', N'Furkan Ertekin', N'testimonial-2.jpg', N'Meyvelerin tadının yoğunluğunu hissediyorsunuz.')
INSERT [dbo].[Clients] ([Id], [Title], [Name], [ImageUrl], [Comment]) VALUES (2, N'Bayıldımm!', N'Enes İpek', N'testimonial-3.jpg', N'Bundan sonra yeni adresim burası.')
INSERT [dbo].[Clients] ([Id], [Title], [Name], [ImageUrl], [Comment]) VALUES (3, N'Muazzam', N'Şeyma Yol', N'testimonial-1.jpg', N'Tadı damağınızda kalacak.')
INSERT [dbo].[Clients] ([Id], [Title], [Name], [ImageUrl], [Comment]) VALUES (4, N'Böyle bir şey yok!', N'Ege Yüksel', N'testimonial-3.jpg', N'Ananaslar çok taze geldi.')
SET IDENTITY_INSERT [dbo].[Clients] OFF
GO
SET IDENTITY_INSERT [dbo].[Contacts] ON 

INSERT [dbo].[Contacts] ([Id], [Text], [Address], [Phone], [Email], [Location], [Twitter], [Facebook], [Instagram], [LinkedIn]) VALUES (1, N'Bize ulaşabileceğin çağrı merkezimiz 7/24 hizmet vermektedir. Sosyal medya hesaplarımızı takip etmeyi unutmayın.', N'Büyükdere Cd. No:147, 34394 Şişli/İstanbul', N'444 22 33', N'info@organicatelier.com', N'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3007.947648573269!2d29.010370812532802!3d41.07013697122234!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14cab6451778cd5b%3A0xcfafcdd628eef4c1!2zRXNlbnRlcGUsIELDvHnDvGtkZXJlIENkLiBObzoxNDcsIDM0Mzk0IMWeacWfbGkvxLBzdGFuYnVs!5e0!3m2!1str!2str!4v1716145068609!5m2!1str!2str" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade', N'https://x.com', N'https://fb.com', N'https://instagram.com', N'https://linkedin.com')
SET IDENTITY_INSERT [dbo].[Contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[Employments] ON 

INSERT [dbo].[Employments] ([Id], [Title], [Status]) VALUES (2, N'Sürdürülebilir', 1)
INSERT [dbo].[Employments] ([Id], [Title], [Status]) VALUES (3, N'Doğaya Saygılı', 1)
INSERT [dbo].[Employments] ([Id], [Title], [Status]) VALUES (4, N'Tamamen Organik', 1)
SET IDENTITY_INSERT [dbo].[Employments] OFF
GO
SET IDENTITY_INSERT [dbo].[Features] ON 

INSERT [dbo].[Features] ([Id], [Title], [Description], [ImageUrl]) VALUES (1, N'Sürdürülebilirliği Hedefler', N'Bilinçli üreticilerin ürünlerini sizinle buluşturarak sağlıklı ve sürdürülebilir bir geleceği sizlerle beraber yaratmayı hedefliyoruz.', N'icon-1.png')
INSERT [dbo].[Features] ([Id], [Title], [Description], [ImageUrl]) VALUES (2, N'Özenle Seçer', N'İlkelerimizle örtüşen yerel üretici ve organik tarım yapan çiftlikleri buluyor, aracısız tedarik ettiğimiz ürünleri gıda mühendislerimizin kontrolleri ile seçiyoruz.', N'icon-2.png')
INSERT [dbo].[Features] ([Id], [Title], [Description], [ImageUrl]) VALUES (3, N'Kalite Süreci', N'Taze gıdada ise her ürün için farklı kriterler uygulayarak size taptaze ulaştırmak için paketliyor, tüm bu kalite denetimlerini düzenli olarak uyguluyoruz.', N'icon-3.png')
SET IDENTITY_INSERT [dbo].[Features] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetail] ON 

INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (1, N'Organik olarak yetiştirilen, üretiminde hiçbir ilaç ve kimyasal kullanılmayan, üreticisinden verilmiş öneri ile içi kadar dış kabuklarını da değerlendirilebileceğiniz sıkmalık portakal, hiçbir kimyasala maruz kalmadan topraktan sofranıza ulaşıyor.', 3)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (2, N'Kimyasal katkı barındırmayan, tat yoğunluğu yüksek ve aroma kalitesi bakımından oldukça zengin olan yerli muz, Organic Atelier tarafından organik tarım esaslarına bağlı kalınarak üretilmektedir.', 5)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (3, N'Yeşil zemin üzerinde hafif donuk tonlarına sahip olan Granny Smith elma, sert yapısı, ekşiliği ve bol sulu olma özelliği ile ön plana çıkmaktadır.', 7)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (4, N'Kıpkırmızı rengi ve lezzetli aroması ile bilinen Scarlet elma, Organic Atelier ile meyve tabaklarınıza ulaşıyor.', 6)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (5, N'Evet mis gibi çilek. Hiç merak etmeyin; ne hormonlu, ne GDO’lu ne de pestisitli. Diğer meyve ve sebzelerimizden hiçbir farkı yok.', 8)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (6, N'Bütün dünyada misafirperverliğin sembolü olarak bilinen ananas dolu dolu içeriğiyle mucizevi bir meyve olarak görülmektedir. Demir, kalsiyum, A, B ve C vitaminleri yanı sıra, lif bakımından zengindir. ', 10)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (7, N'Erken mevsimde hasat edilen yatak limonlar, esnek ve ince kabuklu dinlenmiş limon olarak Organic Atelier''de!', 12)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (8, N'Salatası, çorbası, mezesi, kızartması ya da o çok sevilen tarator mu desek bilemedik. ', 13)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (9, N'İnce ince kıyılmış hali ile her yemeğin başlangıcı olan soğanı, halka halka dilimleyip fırın yemeklerine katabilir, yarım ay şeklinde doğrayarak salatada, piyazda tercih edebilirsiniz. ', 14)
INSERT [dbo].[ProductDetail] ([Id], [Description], [ProductId]) VALUES (11, N'Adı da tadı da bir başka, yemeğe doyulmaz organik köy domatesi! En sevilen sebzelerde başı çeken domatesinizi sabah - akşam demeden günün her vaktinde tüketebilir, isteğinize göre onunla pratik ve lezzetli tarifler oluşturabilirsiniz.', 15)
SET IDENTITY_INSERT [dbo].[ProductDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (3, N'Portakal Sıkmalık', CAST(24.90 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-1.jpg', N'Meyve', 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (5, N'Organik Yerli Muz', CAST(64.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-2.jpg', N'Meyve', 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (6, N'Elma Scarlet', CAST(34.90 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-3.jpg', N'Meyve', 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (7, N'Elma Granny', CAST(42.90 AS Decimal(18, 2)), CAST(700.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-4.jpg', N'Meyve', 1, 0, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (8, N'Organik Çilek', CAST(59.90 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-5.jpg', N'Meyve', 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (10, N'Ananas', CAST(99.90 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-6.jpg', N'Meyve', 1, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (12, N'Organik Yatak Limon', CAST(24.90 AS Decimal(18, 2)), CAST(500.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-7.jpg', N'Sebze', 2, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (13, N'Organik Havuç', CAST(44.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-8.jpg', N'Sebze', 2, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (14, N'Organik Kuru Soğan', CAST(17.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-4.jpg', N'Sebze', 2, 0, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (15, N'Organik Köy Domatesi', CAST(54.90 AS Decimal(18, 2)), CAST(750.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-2.jpg', N'Sebze', 2, 1, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (17, N'Lolorosso Marul', CAST(64.90 AS Decimal(18, 2)), CAST(100.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-3.jpg', N'Yeşillik', 3, 0, 1)
INSERT [dbo].[Products] ([Id], [Title], [Price], [Weight], [Unit], [Image], [Type], [ProductTypeId], [IsPopular], [Status]) VALUES (18, N'Fesleğen', CAST(59.90 AS Decimal(18, 2)), CAST(25.00 AS Decimal(18, 2)), CAST(1.00 AS Decimal(18, 2)), N'product-5.jpg', N'Yeşillik', 3, 1, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (1, N'Meyve', 1)
INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (2, N'Sebze', 1)
INSERT [dbo].[ProductTypes] ([Id], [Name], [Status]) VALUES (3, N'Yeşillikler ve Otlar', 1)
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title2], [Description2], [ImageUrl1], [ImageUrl2], [Page], [Description1], [Title1]) VALUES (1, N'İnsana, Hayvana ve Doğaya Faydalı', N'Misyonumuz doğayı karşımıza alarak değil, yanımıza alarak üretim yapmak ve insanlara sürdürülebilir gıda üretimi için başka bir seçenek olmadığını göstermek. ', N'carousel-1.jpg', N'carousel-2.jpg', N'Index', N'Sürdürülebilir tarım politikalarını izliyor, sağlığı öncelik olarak alıyoruz.', N'Temiz Dünya, Sağlıklı Gıda')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
/****** Object:  Index [IX_ProductDetail_ProductId]    Script Date: 20.05.2024 11:22:59 ******/
CREATE NONCLUSTERED INDEX [IX_ProductDetail_ProductId] ON [dbo].[ProductDetail]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_ProductTypeId]    Script Date: 20.05.2024 11:22:59 ******/
CREATE NONCLUSTERED INDEX [IX_Products_ProductTypeId] ON [dbo].[Products]
(
	[ProductTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsPopular]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT (CONVERT([bit],(0))) FOR [Status]
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

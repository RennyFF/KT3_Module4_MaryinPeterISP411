USE [master]
GO
/****** Object:  Database [SportInventoryDB]    Script Date: 10.10.2024 14:35:33 ******/
CREATE DATABASE [SportInventoryDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportInventoryDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportInventoryDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportInventoryDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportInventoryDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportInventoryDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportInventoryDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportInventoryDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportInventoryDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportInventoryDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportInventoryDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportInventoryDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportInventoryDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportInventoryDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportInventoryDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportInventoryDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportInventoryDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportInventoryDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportInventoryDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportInventoryDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportInventoryDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportInventoryDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportInventoryDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportInventoryDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportInventoryDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportInventoryDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportInventoryDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportInventoryDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportInventoryDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportInventoryDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportInventoryDB] SET  MULTI_USER 
GO
ALTER DATABASE [SportInventoryDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportInventoryDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportInventoryDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportInventoryDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportInventoryDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportInventoryDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportInventoryDB] SET QUERY_STORE = OFF
GO
USE [SportInventoryDB]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10.10.2024 14:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sex]    Script Date: 10.10.2024 14:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Sex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10.10.2024 14:35:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[SecondName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[PatronomycName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](70) NOT NULL,
	[PasportSerial] [int] NOT NULL,
	[PasportNumber] [int] NOT NULL,
	[Birthday] [date] NOT NULL,
	[LastEntry] [date] NULL,
	[TypeOfEntry] [bit] NULL,
	[SexId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (2, N'Исполнитель')
INSERT [dbo].[Role] ([Id], [Name]) VALUES (3, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Sex] ON 

INSERT [dbo].[Sex] ([Id], [Name]) VALUES (1, N'Женский')
INSERT [dbo].[Sex] ([Id], [Name]) VALUES (2, N'Мужской')
SET IDENTITY_INSERT [dbo].[Sex] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (1, 3, N'Акимов', N'Ян', N'Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781)-785-58-37', 2367, 558134, CAST(N'1993-07-03' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (2, 2, N'Гончарова', N'Ульяна', N'Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230)-906-88-15', 7101, 669343, CAST(N'1975-06-22' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (3, 1, N'Анохина', N'Елизавета', N'Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555)-444-83-16', 3455, 719630, CAST(N'1991-08-16' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (4, 3, N'Николаев', N'Илья', N'Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392)-682-44-42', 2377, 871623, CAST(N'1970-12-22' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (5, 2, N'Уткин', N'Дмитрий', N'Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836)-429-03-86', 8755, 921148, CAST(N'1999-05-04' AS Date), NULL, 0, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (6, 2, N'Куликова', N'Стефания', N'Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283)-945-30-92', 4355, 104594, CAST(N'1994-12-06' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (7, 2, N'Волков', N'Егор', N'Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621)-359-36-69', 2791, 114390, CAST(N'1995-03-28' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (8, 1, N'Соколова', N'Софья', N'Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440)-561-03-14', 5582, 126286, CAST(N'1977-03-27' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (9, 3, N'Голубева', N'Полина', N'Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331)-918-24-34', 2978, 133653, CAST(N'1975-04-12' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (10, 3, N'Вишневская', N'Мария', N'Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493)-219-39-42', 7512, 141956, CAST(N'1975-12-23' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (11, 3, N'Васильева', N'Арина', N'Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407)-485-50-30', 5046, 158433, CAST(N'2000-01-22' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (12, 3, N'Павлов', N'Дмитрий', N'Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919)-478-24-97', 2460, 169505, CAST(N'1983-10-03' AS Date), NULL, 0, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (13, 2, N'Горбунова', N'Мирослава', N'Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482)-802-95-80', 3412, 174593, CAST(N'1998-03-03' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (14, 3, N'Демина', N'София', N'Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455)-944-64-49', 4950, 183034, CAST(N'1993-06-08' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (15, 2, N'Петрова', N'Алина', N'Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710)-388-25-63', 5829, 219464, CAST(N'1980-09-23' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (16, 2, N'Плотников', N'Григорий', N'Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759)-452-38-46', 6443, 208059, CAST(N'1991-03-13' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (17, 2, N'Прохорова', N'Есения', N'Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687)-801-13-32', 7079, 213265, CAST(N'1998-04-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (18, 2, N'Чернов', N'Алексей', N'Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425)-783-22-53', 8207, 522702, CAST(N'1980-04-16' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (19, 3, N'Горбунов', N'Степан', N'Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889)-449-43-91', 9307, 232158, CAST(N'1993-07-23' AS Date), NULL, 1, 2)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (20, 2, N'Рябинина', N'Софья', N'Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825)-301-82-50', 1357, 242839, CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (21, 2, N'Козлова', N'Яна', N'Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397)-334-20-86', 1167, 256636, CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (22, 3, N'Лукьянова', N'Ульяна', N'Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241)-570-30-40', 1768, 266986, CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (23, 2, N'Кондрашова', N'Арина', N'Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713)-462-82-65', 1710, 427875, CAST(N'1976-12-22' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (24, 3, N'Быкова', N'Виктория', N'Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854)-822-23-31', 1806, 289145, CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [RoleId], [SecondName], [FirstName], [PatronomycName], [Email], [Login], [Password], [Phone], [PasportSerial], [PasportNumber], [Birthday], [LastEntry], [TypeOfEntry], [SexId]) VALUES (25, 2, N'Гуляев', N'Тимофей', N'Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439)-713-61-17', 1587, 291249, CAST(N'1987-02-05' AS Date), NULL, 0, 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Role]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Sex] FOREIGN KEY([SexId])
REFERENCES [dbo].[Sex] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Sex]
GO
USE [master]
GO
ALTER DATABASE [SportInventoryDB] SET  READ_WRITE 
GO

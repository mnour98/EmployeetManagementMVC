USE [master]
GO
/****** Object:  Database [Employee2021]    Script Date: 2021-12-10 2:32:36 PM ******/
CREATE DATABASE [Employee2021]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Employee2021', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\Employee2021.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Employee2021_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER2017\MSSQL\DATA\Employee2021_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Employee2021] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Employee2021].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Employee2021] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Employee2021] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Employee2021] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Employee2021] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Employee2021] SET ARITHABORT OFF 
GO
ALTER DATABASE [Employee2021] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Employee2021] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Employee2021] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Employee2021] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Employee2021] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Employee2021] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Employee2021] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Employee2021] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Employee2021] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Employee2021] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Employee2021] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Employee2021] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Employee2021] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Employee2021] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Employee2021] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Employee2021] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Employee2021] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Employee2021] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Employee2021] SET  MULTI_USER 
GO
ALTER DATABASE [Employee2021] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Employee2021] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Employee2021] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Employee2021] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Employee2021] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Employee2021] SET QUERY_STORE = OFF
GO
USE [Employee2021]
GO
/****** Object:  Table [dbo].[group]    Script Date: 2021-12-10 2:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[group_number] [varchar](50) NULL,
	[year] [varchar](50) NULL,
 CONSTRAINT [PK_group] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job]    Script Date: 2021-12-10 2:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[position] [varchar](50) NOT NULL,
	[salary] [int] NOT NULL,
 CONSTRAINT [PK_job] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[registration]    Script Date: 2021-12-10 2:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[registration](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](20) NULL,
	[lastname] [varchar](20) NULL,
	[identification_number] [varchar](20) NULL,
	[job_id] [int] NULL,
	[group_id] [int] NULL,
	[mobile_number] [int] NULL,
	[email_ad] [varchar](50) NULL,
 CONSTRAINT [PK_registration] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 2021-12-10 2:32:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](50) NULL,
	[lastname] [varchar](50) NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[group] ON 

INSERT [dbo].[group] ([id], [group_number], [year]) VALUES (1, N'group1', N'2017')
INSERT [dbo].[group] ([id], [group_number], [year]) VALUES (3004, N'group2', N'2021')
SET IDENTITY_INSERT [dbo].[group] OFF
GO
SET IDENTITY_INSERT [dbo].[job] ON 

INSERT [dbo].[job] ([id], [position], [salary]) VALUES (2, N'Boss', 150000)
INSERT [dbo].[job] ([id], [position], [salary]) VALUES (2011, N'Developper', 70000)
SET IDENTITY_INSERT [dbo].[job] OFF
GO
SET IDENTITY_INSERT [dbo].[registration] ON 

INSERT [dbo].[registration] ([id], [firstname], [lastname], [identification_number], [job_id], [group_id], [mobile_number], [email_ad]) VALUES (3014, N'Yazan', N'Shaar', N'5474121598', 2, 1, 55478, N'yzaxmamamw@hotmail.com')
INSERT [dbo].[registration] ([id], [firstname], [lastname], [identification_number], [job_id], [group_id], [mobile_number], [email_ad]) VALUES (3015, N'Mohamad Nour', N'AL Shaar', N'2548784248', 2, 3004, 5146499, N'm.alshaar54@gmail.com')
SET IDENTITY_INSERT [dbo].[registration] OFF
GO
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [firstname], [lastname], [username], [password]) VALUES (2, N'Nour', N'Saher', N'nour98', N'1234')
SET IDENTITY_INSERT [dbo].[user] OFF
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_group] FOREIGN KEY([group_id])
REFERENCES [dbo].[group] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_group]
GO
ALTER TABLE [dbo].[registration]  WITH CHECK ADD  CONSTRAINT [FK_registration_job] FOREIGN KEY([job_id])
REFERENCES [dbo].[job] ([id])
GO
ALTER TABLE [dbo].[registration] CHECK CONSTRAINT [FK_registration_job]
GO
USE [master]
GO
ALTER DATABASE [Employee2021] SET  READ_WRITE 
GO

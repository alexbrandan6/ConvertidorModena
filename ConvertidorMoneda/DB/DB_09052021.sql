USE [master]
GO
/****** Object:  Database [ConvertidorMoneda]    Script Date: 09/05/2021 09:42:11 p. m. ******/
CREATE DATABASE [ConvertidorMoneda]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConvertidorMoneda', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ConvertidorMoneda.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ConvertidorMoneda_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ConvertidorMoneda_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ConvertidorMoneda] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConvertidorMoneda].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConvertidorMoneda] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConvertidorMoneda] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConvertidorMoneda] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ConvertidorMoneda] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConvertidorMoneda] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET RECOVERY FULL 
GO
ALTER DATABASE [ConvertidorMoneda] SET  MULTI_USER 
GO
ALTER DATABASE [ConvertidorMoneda] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConvertidorMoneda] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConvertidorMoneda] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConvertidorMoneda] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ConvertidorMoneda] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ConvertidorMoneda] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConvertidorMoneda', N'ON'
GO
ALTER DATABASE [ConvertidorMoneda] SET QUERY_STORE = OFF
GO
USE [ConvertidorMoneda]
GO
/****** Object:  Table [dbo].[tblMoneda]    Script Date: 09/05/2021 09:42:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMoneda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonedaPorMoneda]    Script Date: 09/05/2021 09:42:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonedaPorMoneda](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](500) NULL,
	[idMonedaDesde] [int] NULL,
	[idMonedaA] [int] NULL,
	[Valor] [money] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblMoneda] ON 

INSERT [dbo].[tblMoneda] ([id], [Descripcion]) VALUES (1, N'Dolar')
INSERT [dbo].[tblMoneda] ([id], [Descripcion]) VALUES (2, N'Euro')
INSERT [dbo].[tblMoneda] ([id], [Descripcion]) VALUES (3, N'Peso Argentino')
INSERT [dbo].[tblMoneda] ([id], [Descripcion]) VALUES (4, N'Peso Chileno')
INSERT [dbo].[tblMoneda] ([id], [Descripcion]) VALUES (5, N'Real')
SET IDENTITY_INSERT [dbo].[tblMoneda] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMonedaPorMoneda] ON 

INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (1, N'Valor Dolar a Peso Argentino', 1, 3, 93.0600)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (2, N'Valor Dolar a Euro', 1, 2, 0.8200)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (3, N'Valor Dolar a Peso Chileno', 1, 4, 695.4000)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (4, N'Valor Dolar a Real', 1, 5, 5.2400)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (5, N'Valor Euro a Peso Argentino', 2, 3, 113.2300)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (6, N'Valor Euro a Peso Chileno', 2, 4, 846.0500)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (7, N'Valor Euro a Real', 2, 5, 6.3700)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (8, N'Valor Peso Argentino a Peso Chileno', 3, 4, 7.4700)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (9, N'Valor Peso Argentino a Real', 3, 5, 0.0563)
INSERT [dbo].[tblMonedaPorMoneda] ([id], [Descripcion], [idMonedaDesde], [idMonedaA], [Valor]) VALUES (10, N'Valor Peso Chileno a Real', 4, 5, 0.0100)
SET IDENTITY_INSERT [dbo].[tblMonedaPorMoneda] OFF
GO
/****** Object:  StoredProcedure [dbo].[SP_Obtener_MonedaPorMoneda]    Script Date: 09/05/2021 09:42:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SP_Obtener_MonedaPorMoneda](
@idMonedaDesde int,
@idMonedaA int
)
as
IF @idMonedaDesde = @idMonedaA BEGIN
	SELECT 1 AS Valor
END
ELSE BEGIN
	SELECT Valor FROM tblMonedaPorMoneda WHERE idMonedaDesde = @idMonedaDesde AND idMonedaA = @idMonedaA
END
GO
USE [master]
GO
ALTER DATABASE [ConvertidorMoneda] SET  READ_WRITE 
GO

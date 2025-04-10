USE [master]
GO
/****** Object:  Database [DB_Stickers]    Script Date: 16/01/1404 19:00:35 ******/
CREATE DATABASE [DB_Stickers]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_Stickers', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Stickers.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_Stickers_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_Stickers_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_Stickers].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_Stickers] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_Stickers] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_Stickers] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_Stickers] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_Stickers] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_Stickers] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_Stickers] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_Stickers] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_Stickers] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_Stickers] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_Stickers] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_Stickers] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_Stickers] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_Stickers] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_Stickers] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_Stickers] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_Stickers] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_Stickers] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_Stickers] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_Stickers] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_Stickers] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_Stickers] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_Stickers] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_Stickers] SET  MULTI_USER 
GO
ALTER DATABASE [DB_Stickers] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_Stickers] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_Stickers] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_Stickers] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_Stickers] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_Stickers', N'ON'
GO
USE [DB_Stickers]
GO
/****** Object:  UserDefinedFunction [dbo].[ASCII]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[ASCII] (@source nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    DECLARE @pattern nvarchar(max)
    SET @pattern = N'rn'
    RETURN REPLACE(@source, @pattern, N' ')
END
GO
/****** Object:  UserDefinedFunction [dbo].[CleanString]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[CleanString] (@str nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    RETURN dbo.Fa2En(dbo.NullIfEmpty(dbo.FixPersianChars(@str)))
END
GO
/****** Object:  UserDefinedFunction [dbo].[En2Fa]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[En2Fa]
(
    @str NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    SET @str = REPLACE(@str, '0', N'۰')
    SET @str = REPLACE(@str, '1', N'۱')
    SET @str = REPLACE(@str, '2', N'۲')
    SET @str = REPLACE(@str, '3', N'۳')
    SET @str = REPLACE(@str, '4', N'۴')
    SET @str = REPLACE(@str, '5', N'۵')
    SET @str = REPLACE(@str, '6', N'۶')
    SET @str = REPLACE(@str, '7', N'۷')
    SET @str = REPLACE(@str, '8', N'۸')
    SET @str = REPLACE(@str, '9', N'۹')
    RETURN @str
END
GO
/****** Object:  UserDefinedFunction [dbo].[Fa2En]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[Fa2En]
(
    @str NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    SET @str = REPLACE(@str, N'۰', '0')
    SET @str = REPLACE(@str, N'۱', '1')
    SET @str = REPLACE(@str, N'۲', '2')
    SET @str = REPLACE(@str, N'۳', '3')
    SET @str = REPLACE(@str, N'۴', '4')
    SET @str = REPLACE(@str, N'۵', '5')
    SET @str = REPLACE(@str, N'۶', '6')
    SET @str = REPLACE(@str, N'۷', '7')
    SET @str = REPLACE(@str, N'۸', '8')
    SET @str = REPLACE(@str, N'۹', '9')
    --iphone numeric
    SET @str = REPLACE(@str, N'٠', '0')
    SET @str = REPLACE(@str, N'١', '1')
    SET @str = REPLACE(@str, N'٢', '2')
    SET @str = REPLACE(@str, N'٣', '3')
    SET @str = REPLACE(@str, N'٤', '4')
    SET @str = REPLACE(@str, N'٥', '5')
    SET @str = REPLACE(@str, N'٦', '6')
    SET @str = REPLACE(@str, N'٧', '7')
    SET @str = REPLACE(@str, N'٨', '8')
    SET @str = REPLACE(@str, N'٩', '9')
    RETURN @str
END
GO
/****** Object:  UserDefinedFunction [dbo].[FixPersianChars]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[FixPersianChars] (@str nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    SET @str = ISNULL(@str, ' ')
    SET @str = CASE WHEN @str = 'string' THEN ' ' ELSE @str END
    SET @str = REPLACE(@str, N'ﮎ', N'ک')
    SET @str = REPLACE(@str, N'ﮏ', N'ک')
    SET @str = REPLACE(@str, N'ﮐ', N'ک')
    SET @str = REPLACE(@str, N'ﮑ', N'ک')
    SET @str = REPLACE(@str, N'ك', N'ک')
    SET @str = REPLACE(@str, N'ي', N'ی')
    SET @str = REPLACE(@str, N' ', N' ')
    SET @str = REPLACE(@str, N'‌', N' ')
    SET @str = REPLACE(@str, N'ھ', N'ه')
    RETURN @str
END
GO
/****** Object:  UserDefinedFunction [dbo].[HasValue]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[HasValue] 
(
    @value NVARCHAR(MAX),
    @ignoreWhiteSpace BIT
)
RETURNS BIT
AS
BEGIN
    RETURN CASE @ignoreWhiteSpace 
        WHEN 1 THEN CASE WHEN RTRIM(LTRIM(@value)) <> '' THEN 1 ELSE 0 END 
        ELSE CASE WHEN @value <> '' THEN 1 ELSE 0 END 
        END
END
GO
/****** Object:  UserDefinedFunction [dbo].[Msg]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   FUNCTION [dbo].[Msg] (@str nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    RETURN REPLACE(@str, N'Core .Net SqlClient Data Provider-', '') + dbo.CleanString(@str)
END
GO
/****** Object:  UserDefinedFunction [dbo].[NullIfEmpty]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[NullIfEmpty] (@str nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    RETURN CASE WHEN LEN(@str) = 0 THEN NULL ELSE @str END
END
GO
/****** Object:  UserDefinedFunction [dbo].[RemovePoint]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[RemovePoint] (@str nvarchar(max))
RETURNS nvarchar(max)
AS
BEGIN
    SET @str = REPLACE(@str, N',', N'')
    SET @str = REPLACE(@str, N'.', N'')
    SET @str = REPLACE(@str, N'/', N'')
    SET @str = REPLACE(@str, N'.', N'')
    RETURN @str
END
GO
/****** Object:  UserDefinedFunction [dbo].[ToDecimal]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToDecimal]
(
    @value NVARCHAR(MAX)
)
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN CONVERT(DECIMAL(18,2), @value)
END
GO
/****** Object:  UserDefinedFunction [dbo].[ToInt]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToInt]
(
    @value NVARCHAR(MAX)
)
RETURNS INT
AS
BEGIN
    RETURN CONVERT(INT, @value)
END
GO
/****** Object:  UserDefinedFunction [dbo].[ToNumeric]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ToNumeric]
(
    @value INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    RETURN FORMAT(@value, N'N0')
END
GO
/****** Object:  Table [dbo].[Stickers]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stickers](
	[StickerID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [nvarchar](4000) NULL,
	[Sticker] [nvarchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Stickers] PRIMARY KEY CLUSTERED 
(
	[StickerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Stickers] ADD  CONSTRAINT [DF_Stickers_Title]  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[Stickers] ADD  CONSTRAINT [DF_Stickers_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Stickers] ADD  CONSTRAINT [DF_Stickers_Description]  DEFAULT (N'') FOR [Description]
GO
ALTER TABLE [dbo].[Stickers] ADD  CONSTRAINT [DF_Stickers_sticker]  DEFAULT (N'') FOR [Sticker]
GO
ALTER TABLE [dbo].[Stickers] ADD  CONSTRAINT [DF_Stickers_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
/****** Object:  StoredProcedure [dbo].[StickersDelete]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StickersDelete]
    @StickerID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @RowsAffected INT;

    DELETE FROM dbo.Stickers
WHERE StickerID = @StickerID;

    SET @RowsAffected = @@ROWCOUNT;

    IF @RowsAffected = 1
BEGIN

        SELECT 1 AS Result;
    END
ELSE
BEGIN
        SELECT 0 AS Result;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[StickersFindByID]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StickersFindByID]
    @StickerID INT
AS
BEGIN
    SELECT StickerID, Title, Price, Description, Sticker, CreatedDate
    FROM Stickers
    WHERE        (StickerID = @StickerID)
END
GO
/****** Object:  StoredProcedure [dbo].[StickersGetAll]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StickersGetAll]
    @PageNumber INT = 1,
    @PageSize INT = 10
AS
BEGIN
    SELECT StickerID, Title, Price, Description, Sticker, CreatedDate,
        CONVERT(DECIMAL, COUNT(*) OVER())                      AS TotalRecords,
        CEILING(CONVERT(DECIMAL, COUNT(*) OVER()) / @PageSize) AS TotalPages,
        @PageNumber                                            AS CurrentPage,
        @PageSize                                             AS PageSize
    FROM Stickers
    ORDER BY StickerID DESC
    OFFSET(@PageNumber - 1) * @PageSize ROWS FETCH NEXT @PageSize ROWS ONLY;
END
GO
/****** Object:  StoredProcedure [dbo].[StickersInsert]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StickersInsert]
    @Title NVARCHAR(100),
    @Price DECIMAL(18, 0),
    @Description NVARCHAR(4000),
    @Sticker NVARCHAR(4000)
AS
BEGIN
    INSERT INTO dbo.Stickers
        (Title, Price, Description, Sticker)
    OUTPUT
    inserted.*
    VALUES
        (@Title, @Price, @Description, @Sticker)


END
GO
/****** Object:  StoredProcedure [dbo].[StickersUpdate]    Script Date: 16/01/1404 19:00:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[StickersUpdate]
    @StickerID INT,
    @Title NVARCHAR(100),
    @Price DECIMAL(18, 0),
    @Description NVARCHAR(4000),
    @Sticker NVARCHAR(4000)=NULL
AS
BEGIN

    update dbo.Stickers
set Title = @Title,
    Price = @Price,
    Description = @Description,
              sticker=COALESCE(Nullif(@Sticker, ''), Sticker)
              OUTPUT inserted.*
where StickerID = @StickerID;

END
GO
USE [master]
GO
ALTER DATABASE [DB_Stickers] SET  READ_WRITE 
GO

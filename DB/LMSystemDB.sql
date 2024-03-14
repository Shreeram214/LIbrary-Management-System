USE [master]
GO
/****** Object:  Database [LibraryManagementSystem]    Script Date: 14/03/2024 21:34:23 ******/
CREATE DATABASE [LibraryManagementSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LibraryManagementSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\LibraryManagementSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LibraryManagementSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS2019\MSSQL\DATA\LibraryManagementSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LibraryManagementSystem] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LibraryManagementSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LibraryManagementSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LibraryManagementSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LibraryManagementSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LibraryManagementSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LibraryManagementSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LibraryManagementSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LibraryManagementSystem] SET  MULTI_USER 
GO
ALTER DATABASE [LibraryManagementSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LibraryManagementSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LibraryManagementSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LibraryManagementSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LibraryManagementSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LibraryManagementSystem] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [LibraryManagementSystem] SET QUERY_STORE = OFF
GO
USE [LibraryManagementSystem]
GO
/****** Object:  User [sa1]    Script Date: 14/03/2024 21:34:23 ******/
CREATE USER [sa1] FOR LOGIN [sa1] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Author] [nvarchar](50) NOT NULL,
	[ISBN] [nvarchar](20) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Picture] [nvarchar](max) NULL,
 CONSTRAINT [PK__Books__3DE0C227906C5D63] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookTransactions]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookTransactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[UserID] [int] NULL,
	[IssueDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[IsReissued] [bit] NULL,
	[ReturnStatus] [bit] NULL,
 CONSTRAINT [PK__BookTran__55433A4B094A9D2E] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fines]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fines](
	[FineID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionID] [int] NOT NULL,
	[FineAmount] [decimal](5, 2) NOT NULL,
	[IsPaid] [bit] NOT NULL,
 CONSTRAINT [PK__Fines__9D4A9BCCC6D65C68] PRIMARY KEY CLUSTERED 
(
	[FineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NULL,
 CONSTRAINT [PK__Roles__8AFACE3AF1C84F3C] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserRoleId] [int] NOT NULL,
	[UserEmail] [nvarchar](30) NOT NULL,
	[UserPhone] [nvarchar](15) NULL,
 CONSTRAINT [PK__Users__1788CCAC7AEB269F] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (1, N'The Catcher in the Rye', N'J.D. Salinger', N'978-0-316-76948-0', 10, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (2, N'To Kill a Mockingbird', N'Harper Lee', N'978-0-06-112008-4', 15, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (3, N'1984', N'George Orwell', N'978-0-452-28423-4', 20, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (4, N'Pride and Prejudice', N'Jane Austen', N'978-0-19-953556-9', 8, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (5, N'The Great Gatsby', N'F. Scott Fitzgerald', N'978-3-16-148410-0', 11, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (6, N'The Lord of the Rings', N'J.R.R. Tolkien', N'978-0-395-19395-4', 18, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (7, N'Harry Potter and the Sorcerer''s Stone', N'J.K. Rowling', N'978-0-7475-3269-6', 25, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (8, N'The Hobbit', N'J.R.R. Tolkien', N'978-0-261-10237-0', 30, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (9, N'The Da Vinci Code', N'Dan Brown', N'978-0-385-50420-1', 7, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (10, N'The Alchemist', N'Paulo Coelho', N'978-0-06-112008-4', 22, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (11, N'The Shining', N'Stephen King', N'978-0-385-12167-5', 14, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (12, N'The Hunger Games', N'Suzanne Collins', N'978-0-439-02348-1', 11, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (13, N'The Girl with the Dragon Tattoo', N'Stieg Larsson', N'978-0-307-45475-0', 16, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (14, N'The Catch-22', N'Joseph Heller', N'978-0-684-80146-9', 19, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (15, N'The Road', N'Cormac McCarthy', N'978-0-307-31142-4', 13, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (16, N'Harry Potter and Glass game', N'Jony Washer', N'761-821-622-2213', 14, NULL)
GO
INSERT [dbo].[Books] ([BookID], [Title], [Author], [ISBN], [Quantity], [Picture]) VALUES (17, N'Power Of Your Subconscious Mind', N'Joseph Murphy', N'93843792329', 10, NULL)
GO
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[BookTransactions] ON 
GO
INSERT [dbo].[BookTransactions] ([TransactionID], [BookID], [UserID], [IssueDate], [ReturnDate], [IsReissued], [ReturnStatus]) VALUES (1, 17, 2, CAST(N'2024-03-05T23:27:15.233' AS DateTime), CAST(N'2024-03-12T23:27:15.233' AS DateTime), 1, 1)
GO
INSERT [dbo].[BookTransactions] ([TransactionID], [BookID], [UserID], [IssueDate], [ReturnDate], [IsReissued], [ReturnStatus]) VALUES (2, 15, 2, CAST(N'2024-03-14T17:01:35.270' AS DateTime), CAST(N'2024-03-29T17:01:35.270' AS DateTime), 1, 1)
GO
INSERT [dbo].[BookTransactions] ([TransactionID], [BookID], [UserID], [IssueDate], [ReturnDate], [IsReissued], [ReturnStatus]) VALUES (3, 14, 2, CAST(N'2024-03-14T16:45:20.677' AS DateTime), CAST(N'2024-03-29T16:45:20.677' AS DateTime), 0, 0)
GO
SET IDENTITY_INSERT [dbo].[BookTransactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Fines] ON 
GO
INSERT [dbo].[Fines] ([FineID], [TransactionID], [FineAmount], [IsPaid]) VALUES (4, 2, CAST(32.00 AS Decimal(5, 2)), 1)
GO
SET IDENTITY_INSERT [dbo].[Fines] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Student')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (3, N'Librarian')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [Username], [UserPassword], [UserRoleId], [UserEmail], [UserPhone]) VALUES (1, N'Shreeram Hankare', N'Shreeram@214', 3, N'shreeramhankare214@gmail.com', N'9130506037')
GO
INSERT [dbo].[Users] ([UserID], [Username], [UserPassword], [UserRoleId], [UserEmail], [UserPhone]) VALUES (2, N'Shrinath Mane', N'Password@123', 2, N'shrinathmane@gmail.com', N'8272919812')
GO
INSERT [dbo].[Users] ([UserID], [Username], [UserPassword], [UserRoleId], [UserEmail], [UserPhone]) VALUES (3, N'Supreet Honmane', N'Password@123', 2, N'supreet@gmail.com', N'9281891282')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[BookTransactions] ADD  CONSTRAINT [DF_BookTransactions_ReturnStatus]  DEFAULT ((0)) FOR [ReturnStatus]
GO
ALTER TABLE [dbo].[BookTransactions]  WITH CHECK ADD  CONSTRAINT [FK__BookTrans__BookI__286302EC] FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[BookTransactions] CHECK CONSTRAINT [FK__BookTrans__BookI__286302EC]
GO
ALTER TABLE [dbo].[BookTransactions]  WITH CHECK ADD  CONSTRAINT [FK__BookTrans__UserI__29572725] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BookTransactions] CHECK CONSTRAINT [FK__BookTrans__UserI__29572725]
GO
ALTER TABLE [dbo].[Fines]  WITH CHECK ADD  CONSTRAINT [FK__Fines__Transacti__2C3393D0] FOREIGN KEY([TransactionID])
REFERENCES [dbo].[BookTransactions] ([TransactionID])
GO
ALTER TABLE [dbo].[Fines] CHECK CONSTRAINT [FK__Fines__Transacti__2C3393D0]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([UserRoleId])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[AccountSP]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AccountSP] 
(
@StatementType VARCHAR(50)=NULL,
@UserEmail VARCHAR(30)=NULL,
@UserPassword VARCHAR(20)=NULL,
@UserRole INT=NULL,
@UserID INT = NULL,
@UserPhoneNo VARCHAR(20)=NULL,
@Username VARCHAR(20)=NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY          
		BEGIN TRANSACTION           
			IF(@StatementType='SignUp')          
			 BEGIN          
			 INSERT INTO [dbo].[Users]
			   ([Username]
			   ,[UserPassword]
			   ,[UserRoleId]
			   ,[UserEmail]
			   ,[UserPhone])
		 VALUES
			   (@Username
			   ,@UserPassword
			   ,@UserRole
			   ,@UserEmail
			   ,@UserPhoneNo
			   )
			   SET @UserID = @@IDENTITY
			   Select @UserID as [UserID]
			 END   

			 IF(@StatementType='GetUserRoles')
			 BEGIN
				 SELECT [RoleID]
					  ,[RoleName]
				  FROM [LibraryManagementSystem].[dbo].[Roles] With(NOLOCK) 
			 END 
			 
			 IF(@StatementType='VerifyUser')
			 BEGIN
				 SELECT [UserID]
					  ,[Username]
					  ,[UserPassword]
					  ,[UserRoleId]
					  ,[UserEmail]
					  ,[UserPhone]
				  FROM [LibraryManagementSystem].[dbo].Users With(NOLOCK) 
				  where UserEmail = @UserEmail and UserRoleId = @UserRole and UserPassword = @UserPassword
			 END 
			 IF(@StatementType='CheckUser')
			 BEGIN
				 SELECT [UserID]
					  ,[Username]
				  FROM [LibraryManagementSystem].[dbo].Users With(NOLOCK) 
				  where UserID = @UserID and UserRoleId = '2';
			 END 
			 IF(@StatementType='GetUserDetails')
			 BEGIN
				 SELECT [UserID]
					  ,[Username]
					  ,[UserRoleId]
					  ,[UserEmail]
					  ,[UserPhone]
				  FROM [LibraryManagementSystem].[dbo].Users With(NOLOCK) 
				  where UserRoleId = @UserRole and UserID = @UserID
			 END 
		COMMIT TRANSACTION;          
	END TRY          
          
	BEGIN CATCH          
	 SELECT ERROR_MESSAGE() AS ErrorMessage;
	  IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;          
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[BooksSP]    Script Date: 14/03/2024 21:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BooksSP] 
(
@StatementType VARCHAR(MAX)=NULL,
@UserEmail VARCHAR(30)=NULL,
@UserRole INT=NULL,
@UserID INT = NULL,
@TransactionID INT = NULL,
@Username VARCHAR(20)=NULL,
@BookId varchar(20)=NULL,
@BookTitle VARCHAR(100)=NULL,
@BookAuthor VARCHAR(100)=NULL,
@ISBN VARCHAR(100)=NULL,
@Quantity INT=NULL,
@IssueDate datetime=null,
@ReturnDate datetime=null,
@DiffDay int= NULL
)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY          
		BEGIN TRANSACTION           
			IF(@StatementType='GetBookList')          
			 BEGIN          
			 SELECT [BookID],[Title],[Author],[ISBN],[Quantity]
				FROM [dbo].[Books] WITH(NOLOCK) Where Quantity >1;
			 END  
			 IF(@StatementType='CheckDuplicate')          
			 BEGIN          
			 SELECT [BookID]
				FROM [dbo].[Books] WITH(NOLOCK) Where [Title] = @BookTitle;
			 END  
			 IF(@StatementType='AddNewBook')          
			 BEGIN          
				 INSERT INTO [dbo].[Books]
					   ([Title]
					   ,[Author]
					   ,[ISBN]
					   ,[Quantity])
				 VALUES
					   (@BookTitle,@BookAuthor,@ISBN,@Quantity);
				IF(@@ROWCOUNT>0)
				BEGIN
					SELECT @@IDENTITY as ID;
				END
			 END 
			 IF(@StatementType = 'BorroweBook')
			 BEGIN
				 INSERT INTO [dbo].[BookTransactions]
					   ([BookID]
					   ,[UserID]
					   ,[IssueDate]
					   ,[ReturnDate]
					   ,[IsReissued])
				 VALUES
					   (@BookId
					   ,@UserID
					   ,GETDATE()
					   ,DATEADD(DAY, 15, GETDATE())
					   ,'False');
				IF(@@ROWCOUNT>0)
				BEGIN
					SELECT @@IDENTITY as ID;
					UPDATE Books SET Quantity = Quantity-1 where BookID =@BookId
				END
			 END
			 IF(@StatementType = 'CheckUserReturn')
			 BEGIN
				Select TransactionID,IssueDate,ReturnDate From BookTransactions WITH(NOLOCK) 
				WHERE BookID = @BookId and UserID =@UserID and [ReturnStatus] = 0
			 END
			 IF(@StatementType = 'CheckUserReIssue')
			 BEGIN
				Select TransactionID,IssueDate,ReturnDate From BookTransactions WITH(NOLOCK) 
				WHERE BookID = @BookId and UserID =@UserID and [ReturnStatus] = 0 and IsReissued = 0;
			 END
			 IF(@StatementType = 'ReIssueBook')
			 BEGIN
				SET @TransactionID = (Select TOP(1) TransactionID From BookTransactions WITH(NOLOCK) 
				WHERE BookID = @BookId and UserID =@UserID and IsReissued = 0 and [ReturnStatus] = 0)
				IF(@TransactionID IS NOT NULL)
				BEGIN
					
					SET @ReturnDate = (Select Top(1) ReturnDate From BookTransactions WITH(NOLOCK) 
					WHERE TransactionID = @TransactionID)

					IF(@ReturnDate < GETDATE())
					BEGIN
						SET @DiffDay = (SELECT DATEDIFF(day,@ReturnDate,GETDATE()) AS days_difference)
						INSERT INTO Fines (TransactionID,FineAmount,IsPaid)
						VALUES(@TransactionID,(SELECT @DiffDay*2 AS FineAmt),1)
					END

					UPDATE BookTransactions
					SET IssueDate = GETDATE(), ReturnDate = DATEADD(DAY, 15, GETDATE())
					,IsReissued = 1
					WHERE BookID = @BookId and UserID =@UserID
					SELECT 'Success' as Result
				END
			 END
			 IF(@StatementType = 'ReturnBook')
			 BEGIN
				 SET @TransactionID = (Select Top(1) TransactionID From BookTransactions WITH(NOLOCK) 
				WHERE BookID = @BookId and UserID =@UserID and [ReturnStatus] = 0)
				IF(@TransactionID IS NOT NULL)
				BEGIN
					SET @ReturnDate = (Select Top(1) ReturnDate From BookTransactions WITH(NOLOCK) 
					WHERE TransactionID = @TransactionID)

					IF(@ReturnDate < GETDATE())
					BEGIN
						SET @DiffDay = (SELECT DATEDIFF(day,@ReturnDate,GETDATE()) AS days_difference)
						INSERT INTO Fines (TransactionID,FineAmount,IsPaid)
						VALUES(@TransactionID,(SELECT @DiffDay*2 AS FineAmt),1)
					END
					UPDATE BookTransactions
					SET [ReturnStatus] = 1
					WHERE BookID = @BookId and UserID =@UserID
					IF(@@ROWCOUNT>0)
					BEGIN
						UPDATE Books SET Quantity = Quantity+1 where BookID =@BookId
						SELECT 'Success' as Result
					END
				END
				
			 END
		COMMIT TRANSACTION;          
	END TRY          
          
	BEGIN CATCH          
	 SELECT ERROR_MESSAGE() AS ErrorMessage;
	  IF @@TRANCOUNT > 0
		ROLLBACK TRANSACTION;          
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [LibraryManagementSystem] SET  READ_WRITE 
GO

CREATE PROCEDURE [dbo].[BooksInsert]

@BookId INT OUTPUT,
@BookName VARCHAR (200),
@BookQuantity INT,
--@BookDescription VARCHAR (200),
@PublisherId INT,
@CategoryId INT,
@IsActive BIT = 1,
@CreatedBy INT,
@CreatedOn DATETIME,
@ModifiedBy INT,
@ModifiedOn DATETIME

AS
BEGIN
	INSERT [Books]
	(
		[BookName],
		[BookQuantity],
		--[BookDescription],
		[PublisherId],
		[CategoryId],
		[IsActive],
		[CreatedBy],
		[CreatedOn],
		[ModifiedBy],
		[ModifiedOn]
	)
	VALUES
	(
		@BookName,
		@BookQuantity,
		--@BookDescription,
		@PublisherId,
		@CategoryId,
		@IsActive,
		@CreatedBy,
		GETDATE(),
		@ModifiedBy,
		@ModifiedOn
	)
	SET @BookId = @@IDENTITY;
END
GO



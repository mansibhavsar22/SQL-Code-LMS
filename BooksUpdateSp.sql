CREATE PROCEDURE [dbo].[BooksUpdate]

@BookId INT,
@BookName VARCHAR (200),
@BookQuantity INT,
--@BookDescription VARCHAR (200),
@PublisherId INT,
@CategoryId INT,
@IsActive BIT,
@CreatedBy INT,
@CreatedOn DATETIME,
@ModifiedBy INT,
@ModifiedOn DATETIME

AS
BEGIN
	UPDATE
		[Books]
	SET
		[BookName] = @BookName,
		[BookQuantity] = @BookQuantity,
		--[BookDescription] = @BookDescription,
		[PublisherId] = @PublisherId,
		[CategoryId] = @CategoryId,
		--[IsActive] = @IsActive,
		[ModifiedBy] = @ModifiedBy,
		[ModifiedOn] = GETDATE()
	WHERE
		[BookId] = @BookId
END
GO



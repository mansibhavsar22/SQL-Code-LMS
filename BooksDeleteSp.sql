CREATE PROCEDURE [dbo].[BooksDelete]
@BookId INT

AS
BEGIN
	UPDATE [Books]
	SET IsActive = 0 
	WHERE
	[BookId] = @BookId
END
GO



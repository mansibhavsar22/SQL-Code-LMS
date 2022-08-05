CREATE PROCEDURE [dbo].[BooksGetDetails]

@BookId INT

AS
BEGIN
	SELECT
		ISNULL([BookId], '') AS [BookId],
		ISNULL([BookName], '') AS [BookName],
		ISNULL([BookQuantity], '') AS [BookQuantity],
		--ISNULL([BookDescription], '') AS [BookDescription],
		ISNULL([PublisherName], '') AS [PublisherName],
		ISNULL([CategoryName], '') AS [CategoryName],
		ISNULL(Books.[IsActive], '') AS [IsActive],
		ISNULL(Books.[CreatedBy], '') AS [CreatedBy],
		ISNULL(Books.[CreatedOn], '') AS [CreatedOn],
		ISNULL(Books.[ModifiedBy], '') AS [ModifiedBy],
		ISNULL(Books.[ModifiedOn], '') AS [ModifiedOn],
		ISNULL(Books.[PublisherId], '') AS [PublisherId],
		ISNULL(Books.[CategoryId], '') AS [CategoryId]
	FROM
		[Books]
		Inner join Publishers On Books.PublisherId = Publishers.PublisherId 
		inner join Categories On Books.CategoryId = Categories.CategoryId
	WHERE
		[BookId] = @BookId
END
GO



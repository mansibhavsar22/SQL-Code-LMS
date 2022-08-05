CREATE PROCEDURE [dbo].[PublishersGetList]

AS
BEGIN
	SELECT 
		ISNULL([PublisherId], '') AS [PublisherId],
		ISNULL([PublisherName], '') AS [PublisherName],
		ISNULL([PublishDate], '') AS [PublishDate],
		ISNULL([IsActive], '') AS [IsActive],
		ISNULL([CreatedBy], '') AS [CreatedBy],
		ISNULL([CreatedOn], '') AS [CreatedOn],
		ISNULL([ModifiedBy], '') AS [ModifiedBy],
		ISNULL([ModifiedOn], '') AS [ModifiedOn]
	FROM
		[Publishers]		
END
GO



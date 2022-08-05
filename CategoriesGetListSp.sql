CREATE PROCEDURE [dbo].[CategoriesGetList]

AS
BEGIN
	SELECT 
		ISNULL([CategoryId], '') AS [CategoryId],
		ISNULL([CategoryName], '') AS [CategoryName],
		ISNULL([IsActive], '') AS [IsActive],
		ISNULL([CreatedBy], '') AS [CreatedBy],
		ISNULL([CreatedOn], '') AS [CreatedOn],
		ISNULL([ModifiedBy], '') AS [ModifiedBy],
		ISNULL([ModifiedOn], '') AS [ModifiedOn]
	FROM
		[Categories]		
END
GO



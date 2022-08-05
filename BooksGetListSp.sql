CREATE PROCEDURE [dbo].[BooksGetList] 
@BookName Varchar(100) = null,
@BookQuantity  INT = null,
@PublisherId VARCHAR(100) = null,
@CategoryId VARCHAR(100) = null,
@PageNumber int,
@PageSize int,
@TotalRecords int OUTPUT

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

	Row_number() OVER (ORDER BY BookId) AS Rownumber
	INTO #Results 
	FROM
		[Books]	
		Inner join Publishers On Books.PublisherId = Publishers.PublisherId 
		inner join Categories On Books.CategoryId = Categories.CategoryId
		
		Where
		(@BookName is Null or [BookName] Like '%'+(@BookName + '%'))
		AND --(@PublisherId is Null or Books.[PublisherId] = @PublisherId)
		((@PublisherId is Null or [Books].PublisherId IN(SELECT * FROM dbo.GetCategories(@PublisherId, ',') )))
		--And (@CategoryId is Null or Books.[CategoryId] = @CategoryId)
		AND (@CategoryId is Null or [Books].CategoryId IN(
		--Declare @CategoryId VARCHAR(100) = '1,2'
        SELECT * FROM dbo.GetCategories(@CategoryId, ',')
    ))
		And ((Books.IsActive = 1))

	ORDER BY BookId
    --   OFFSET (@PageNumber - 1) * @PageSize ROWS
	   --FETCH NEXT @PageSize ROWS ONLY

	Select @TotalRecords = COUNT (BookId) 
	From #Results 

	SELECT *, @TotalRecords as TotalRecords FROM #Results
	WHERE 
	 Rownumber BETWEEN (@PageNumber - 1) * @PageSize + 1 AND
	@PageNumber * @PageSize

	   --return @TotalRecords

	   Drop Table #Results
	   return @TotalRecords
END
GO



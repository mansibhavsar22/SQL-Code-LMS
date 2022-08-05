CREATE TABLE [dbo].[IssuedBookDetails](
	[IssueDetailsId] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NULL,
	[IssueId] [int] NULL,
	[BookQuantity] [int] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IssueDetailsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[IssuedBookDetails]  WITH CHECK ADD  CONSTRAINT [FK_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([BookId])
GO

ALTER TABLE [dbo].[IssuedBookDetails] CHECK CONSTRAINT [FK_BookId]
GO

ALTER TABLE [dbo].[IssuedBookDetails]  WITH CHECK ADD  CONSTRAINT [FK_IssueId] FOREIGN KEY([IssueId])
REFERENCES [dbo].[IssuedBooks] ([IssueId])
GO

ALTER TABLE [dbo].[IssuedBookDetails] CHECK CONSTRAINT [FK_IssueId]
GO



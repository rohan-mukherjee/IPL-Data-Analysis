USE [IPL]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Match_Details](
	[id] [nvarchar](100) NOT NULL,
	[city] [nvarchar](255) NULL,
	[date] [datetime] NULL,
	[player_of_match] [nvarchar](255) NULL,
	[venue] [nvarchar](255) NULL,
	[neutral_venue] [float] NULL,
	[team1] [nvarchar](255) NULL,
	[team2] [nvarchar](255) NULL,
	[toss_winner] [nvarchar](255) NULL,
	[toss_decision] [nvarchar](255) NULL,
	[winner] [nvarchar](255) NULL,
	[result] [nvarchar](255) NULL,
	[result_margin] [float] NULL,
	[eliminator] [nvarchar](255) NULL,
	[method] [nvarchar](255) NULL,
	[umpire1] [nvarchar](255) NULL,
	[umpire2] [nvarchar](255) NULL,
	[H_Ground] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



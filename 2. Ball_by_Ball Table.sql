USE [IPL]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Ball_by_Ball](
	[id] [nvarchar](100) NOT NULL,
	[innings] [bit] NULL,
	[over] [tinyint] NULL,
	[ball] [tinyint] NULL,
	[batsman] [varchar](50) NULL,
	[non_striker] [varchar](50) NULL,
	[bowler] [varchar](50) NULL,
	[batsman_runs] [tinyint] NULL,
	[extra_runs] [tinyint] NULL,
	[total_runs] [tinyint] NULL,
	[non_boundary] [tinyint] NULL,
	[is_wicket] [tinyint] NULL,
	[dismissal_kind] [varchar](50) NULL,
	[player_dismissed] [varchar](50) NULL,
	[fielder] [varchar](50) NULL,
	[extras_type] [varchar](50) NULL,
	[batting_team] [varchar](50) NULL,
	[bowling_team] [varchar](50) NULL,
	[new_innings] [tinyint] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Ball_by_Ball]  WITH CHECK ADD  CONSTRAINT [FK_Match_Details_Ball_by_Ball] FOREIGN KEY([id])
REFERENCES [dbo].[Match_Details] ([id])
GO

ALTER TABLE [dbo].[Ball_by_Ball] CHECK CONSTRAINT [FK_Match_Details_Ball_by_Ball]
GO



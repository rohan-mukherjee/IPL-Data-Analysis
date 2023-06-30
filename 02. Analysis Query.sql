

SELECT TOP 10 * FROM [dbo].[Match_Details]
SELECT TOP 10 * FROM [dbo].[Ball_by_Ball]

---------------------------
-- || Ground Wise Match Count || --
---------------------------

SELECT venue,COUNT(ID)
FROM [dbo].[Match_Details]
GROUP BY venue
ORDER BY COUNT(ID) DESC



---------------------------
-- || Ground Wise Match Count with Toss Decision || --
---------------------------

SELECT venue 
			,COUNT(ID) Tot_Matches
			,SUM(CASE WHEN toss_decision = 'BAT' THEN 1 ELSE 0 END) AS Batting
			,SUM(CASE WHEN toss_decision = 'field' THEN 1 ELSE 0 END) AS Fielding
FROM [dbo].[Match_Details]
GROUP BY venue
ORDER BY COUNT(ID) DESC




---------------------------
-- || Ground Wise Match Count with Toss Decision & Wining Decision || --
---------------------------

SELECT venue 
			,COUNT(ID) Tot_Matches
			,SUM(CASE WHEN toss_decision = 'BAT' THEN 1 ELSE 0 END) AS Batting
			,SUM(CASE WHEN toss_decision = 'field' THEN 1 ELSE 0 END) AS Fielding
			,SUM(CASE WHEN Result = 'Runs' THEN 1 ELSE 0 END) AS Winning_By_Runs
			,SUM(CASE WHEN Result = 'Wickets' THEN 1 ELSE 0 END) AS Winning_By_Runs
FROM [dbo].[Match_Details]
GROUP BY venue
ORDER BY COUNT(ID) DESC

SELECT venue 
			,COUNT(ID) Tot_Matches
FROM [dbo].[Match_Details]
WHERE Result = 'Runs' AND venue = 'Eden Gardens'
GROUP BY venue
ORDER BY COUNT(ID) DESC


---------------------------
-- | Ground wise Eliminator Matches | --
---------------------------

USE [IPL]

SELECT CASE 
					WHEN venue = 'Dubai International Cricket Stadium' THEN 'Dubai'
					WHEN venue = 'Sheikh Zayed Stadium' THEN 'SK Zayed'
					WHEN venue = 'Wankhede Stadium' THEN 'Wankhede'
					WHEN venue = 'Feroz Shah Kotla' THEN 'Feroz Shah'
					WHEN venue = 'M Chinnaswamy Stadium' THEN 'Chinnaswamy'
					WHEN venue = 'MA Chidambaram Stadium, Chepauk' THEN 'Chepauk'
					WHEN venue = 'Rajiv Gandhi International Stadium, Uppal' THEN 'Rajiv Gandhi Int'
					WHEN venue = 'Sardar Patel Stadium, Motera' THEN 'Motera'
					WHEN venue = 'Saurashtra Cricket Association Stadium' THEN 'Saurashtra'
					ELSE Venue
				END Grounds
			, COUNT(ID) No_of_Eliminator
FROM [dbo].[Match_Details]
WHERE eliminator = 'Y'
GROUP BY venue
ORDER BY COUNT(ID) DESC

---------------------------
-- | Ground Wise Most matches Win by Team | --
---------------------------

;WITH CTE
AS
(
	SELECT TOP 10 Venue,Count(ID) tot_Matches FROM [dbo].[Match_Details]
	GROUP BY Venue ORDER BY Count(ID) DESC
)
, CTE2
AS
(
	SELECT m.venue
				, winner
				, COUNT(ID) No_Of_Matches_Win
	FROM [dbo].[Match_Details] M
	INNER JOIN CTE C
		ON M.venue = C.venue
	WHERE winner IS NOT NULL
	GROUP BY m.venue, winner
	--ORDER BY COUNT(ID) DESC
)
,CTE3
AS
(
	SELECT *
				, ROW_NUMBER() OVER(PARTITION BY Venue
														ORDER BY  Venue,No_Of_matches_Win DESC) MatchWin
	FROM CTE2
)
SELECT C.venue
			, C.tot_Matches
			, C3.winner
			, C3.No_Of_Matches_Win
FROM CTE3 C3
INNER JOIN CTE C
	ON C.venue = C3.venue
WHERE MatchWin = 1
ORDER BY C.tot_Matches DESC




---------------------------
-- | Defining home Ground for Teams | --
---------------------------

ALTER TABLE [dbo].[Match_Details]
ADD H_Ground nVarchar(30)


UPDATE [dbo].[Match_Details]
SET H_Ground = 
--SELECT Team1, 
			CASE 
				WHEN Team1 = 'CSK' THEN  'Chepauk'
				WHEN Team1 = 'DC' THEN  'Kotla'
				WHEN Team1 = 'DD' THEN  'Kotla'
				WHEN Team1 = 'GL' THEN  'Motera'
				WHEN Team1 = 'KKR' THEN  'Eden'
				WHEN Team1 = 'KTK' THEN  'Nehru'
				WHEN Team1 = 'KXIP' THEN  'Mohali'
				WHEN Team1 = 'MI' THEN  'Wankhede'
				WHEN Team1 = 'PW' THEN  'DY Patil'
				WHEN Team1 = 'RCB' THEN  'Chinnaswamy'
				WHEN Team1 = 'RR' THEN  'Mansingh'
				WHEN Team1 = 'RRP' THEN  'MCAS'
				WHEN Team1 = 'SH' THEN  'Uppal' 
				ELSE NULL
			END
FROM [dbo].[Match_Details]


--------------------------
-- | Ground Wise Most Matches Win by Away Team | --
--------------------------


;WITH CTE
AS
(
	SELECT TOP 20 Venue,Count(ID) tot_Matches FROM [dbo].[Match_Details]
	GROUP BY Venue ORDER BY Count(ID) DESC
)
, CTE2
AS
(
	SELECT M.H_Ground
				,Winner
				,COUNT(1) No_of_Wins
	FROM [dbo].[Match_Details] M
	INNER JOIN CTE C
		ON M.venue = C.venue
	WHERE winner IS NOT NULL
		AND Team1 <> winner
		AND M.venue = M.H_Ground
	GROUP BY M.H_Ground,
						Winner
	--ORDER BY COUNT(ID) DESC
)
,CTE3
AS
(
	SELECT *
					, ROW_NUMBER() OVER (PARTITION BY H_Ground
															ORDER BY H_Ground,No_Of_Wins DESC) Most_Wins
	FROM CTE2

)
SELECT H_Ground
			, Winner
			, No_of_Wins
FROM CTE3 WHERE Most_Wins = 1

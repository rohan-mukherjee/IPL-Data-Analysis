
-------------------
-- | Changing Column DataType | --
-------------------

ALTER TABLE [Ball_by_Ball]
ALTER COLUMN 	inning BIT

ALTER TABLE [Ball_by_Ball]
ALTER COLUMN [over] TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN ball TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN batsman_runs TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN extra_runs TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN total_runs TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN non_boundary TINYINT
	
ALTER TABLE [Ball_by_Ball]
ALTER COLUMN is_wicket TINYINT


-------------------
-- | Index Creation | --
-------------------
CREATE NONCLUSTERED INDEX IX_Ball_by_Ball
ON Ball_by_Ball(id ASC)


-------------------
-- | Updating for Boundary | --
-------------------
BEGIN TRAN --COMMIT --ROLLABCK
UPDATE Ball_by_Ball
SET non_boundary = 1
--SELECT * FROM Ball_by_Ball
WHERE non_boundary = 0 AND batsman_runs IN (6,4) AND extra_runs = 0


-------------------
-- | Team Wise Winning Type | --
-------------------

SELECT Winner,Result,COUNT(ID) No_OF_Wins
FROM [dbo].[Match_Details]
WHERE (Winner IS NOT NULL OR Result NOT IN ('NA','tie'))
--AND Winner = 'RCB'
Group by Winner,Result
ORDER BY Result,COUNT(ID) DESC


-------------------
-- | Team Wise Eliminator Matches | --
-------------------

SELECT Winner,COUNT(ID) No_OF_Wins
FROM [dbo].[Match_Details]
WHERE (Winner IS NOT NULL OR Result NOT IN ('NA','tie')) AND Eliminator = 'Y'
Group by Winner



-------------------
-- | Top 3 Teams While Chasing | --
-------------------
;WITH CTE
AS
(
	SELECT Team1,COUNT(ID) Match_Count 
	FROM [Match_Details] 
	--WHERE DATEPART(YY,date) IN (SELECT MIN(DATEPART(YY,Date)) FROM [Match_Details])
	GROUP BY Team1
)
,CTE2
AS
(
	SELECT team2,COUNT(ID) Match_Count 
	FROM [Match_Details] 
	--WHERE DATEPART(YY,date) IN (SELECT MIN(DATEPART(YY,Date)) FROM [Match_Details])
	GROUP BY Team2
),
CTE3
AS
(
	SELECT * FROM CTE
	UNION ALL
	SELECT * FROM CTE2
),
CTE4	--Total match count Team wise
AS
(
	SELECT Team1,SUM(Match_Count) Match_Played
	FROM CTE3
	GROUP BY Team1
	--ORDER BY SUM(Match_Count) DESC
),
CTE5	--Match Wins by Runs
AS
(
	SELECT *
	FROM (
				SELECT winner,result,COUNT(ID) Match_Wins
				FROM [Match_Details] 
				WHERE result <> 'NA' AND result <> 'tie' AND result = 'runs'
				GROUP BY winner,result
				) A
),
CTE6	--Match Wins by Wickets
AS
(
	SELECT *
	FROM (
				SELECT winner,result,COUNT(ID) Match_Wins
				FROM [Match_Details] 
				WHERE result <> 'NA' AND result <> 'tie' AND result = 'WICKETS'
				GROUP BY winner,result
				) A
)--SELECT * FROM CTE6
SELECT C4.*
			,C5.Match_Wins Chasing
			, C6.Match_Wins Defending
			, FLOOR((CAST(C5.Match_Wins AS FLOAT)/CAST(Match_Played AS FLOAT))*100) [Chasing %]
			, FLOOR((CAST(C6.Match_Wins AS FLOAT)/CAST(Match_Played AS FLOAT))*100) [Defending %]
FROM CTE4 C4
INNER JOIN CTE5 C5
	ON C4.team1 = C5.winner
INNER JOIN CTE6 C6
	ON C4.team1 = C6.winner
--ORDER BY FLOOR((CAST(C5.Match_Wins AS FLOAT)/CAST(Match_Played AS FLOAT))*100) DESC


-----------------
-- | Most Extras by Teams | --
-----------------
SELECT bowling_team, SUM(extra_runs) Tot_Extras
FROM [dbo].[Ball_by_Ball]
where bowling_team IS NOT NULL
GROUP BY bowling_team
ORDER BY SUM(extra_runs) DESC



-----------------
-- | Most Bounderis by Teams | --
-----------------
SELECT bowling_team, SUM(extra_runs) Tot_Extras
FROM [dbo].[Ball_by_Ball]
where bowling_team IS NOT NULL
GROUP BY bowling_team
ORDER BY SUM(extra_runs) DESC




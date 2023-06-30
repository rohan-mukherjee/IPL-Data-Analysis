
---------------------
-- | Finding Wrong Names with " in Column | --
---------------------
SELECT MAX(LEN(batsman)) FROM [dbo].[Ball_by_Ball]
SELECT * FROM [dbo].[Ball_by_Ball] WHERE LEN(batsman) = 23


SELECT MAX(LEN(non_striker)) FROM [dbo].[Ball_by_Ball]
SELECT * FROM [dbo].[Ball_by_Ball] WHERE LEN(non_striker) = 23


SELECT MAX(LEN(bowler)) FROM [dbo].[Ball_by_Ball]
SELECT * FROM [dbo].[Ball_by_Ball] WHERE LEN(bowler) = 23

-- fielder = "MF Maharoof,Shoaib Malik (sub),KD Karthik"
SELECT MAX(LEN(fielder)) FROM [dbo].[Ball_by_Ball]
SELECT * FROM [dbo].[Ball_by_Ball] WHERE LEN(fielder) = 43


---------------------
-- | Replacing the Double quotes from Column | --
---------------------

SELECT REPLACE(fielder,'"',''),fielder,* FROM [dbo].[Ball_by_Ball] WHERE LEN(fielder) = 41

UPDATE [dbo].[Ball_by_Ball]
SET fielder = REPLACE(fielder,'"','')



---------------------
-- | Player Count | --
---------------------

;WITH CTE
AS
(
	SELECT batsman Player FROM [dbo].[Ball_by_Ball]
	UNION ALL
	SELECT non_striker FROM [dbo].[Ball_by_Ball]
	UNION ALL
	SELECT bowler FROM [dbo].[Ball_by_Ball]
	UNION ALL
	SELECT fielder FROM [dbo].[Ball_by_Ball]
),
CTE2
AS
(
	SELECT *,
				ROW_NUMBER() OVER (PARTITION BY Player ORDER BY Player) RowNo
	FROM CTE
)
SELECT * INTO DBO.[Players]
FROM CTE2 WHERE RowNo = 1
--ORDER BY Player


SELECT REPLACE(value,'(sub)','') Player_Name INTO [All_Players]
FROM (SELECT Distinct value
FROM DBO.[Players]
CROSS APPLY STRING_SPLIT(Player,',')) A



-------------------
-- | Most Catches Taken | --
-------------------

SELECT Fielder,COUNT(1) No_Of_Catches
FROM (
			SELECT CASE 
								WHEN fielder = 'NA' THEN bowler 
								ELSE fielder 
							END Fielder
			FROM [dbo].[Ball_by_Ball]
			WHERE dismissal_kind IN ('caught and bowled','caught')
			) A
GROUP BY Fielder
ORDER BY COUNT(1) DESC



-------------------
-- | Batsman with Most Runouts  | --
-------------------
SELECT DISTINCT dismissal_kind FROM [dbo].[Ball_by_Ball]
WHERE dismissal_kind <> 'NA'

SELECT player_dismissed,COUNT(1) No_Of_Runouts
FROM [dbo].[Ball_by_Ball]
WHERE dismissal_kind IN ('run out')
GROUP BY player_dismissed
ORDER BY COUNT(1) DESC


-------------------
-- | Batsman with Most Boundries  | --
-------------------
SELECT batsman, SUM(total_runs) Runs
FROM [dbo].[Ball_by_Ball]
WHERE non_boundary = 1
GROUP BY batsman
ORDER BY SUM(total_runs) DESC


-------------------
-- | Most Runs in a Over  | --
-------------------

SELECT ID,inning,[over],bowling_team,SUM(Total_runs)
FROM [dbo].[Ball_by_Ball]
GROUP BY ID,inning,[over],bowling_team
ORDER BY SUM(Total_runs) DESC

---------------
-- | Innings Column value updation | --
---------------

ALTER TABLE [Ball_by_Ball]
ADD new_innings TinyInt

SELECT ID,innings,[over],Ball,batting_team,
			DENSE_RANK() OVER (PARTITION BY ID ORDER BY ID,batting_team) New_Inn
		INTO #Temp
FROM [dbo].[Ball_by_Ball]



BEGIN TRAN --COMMIT --ROLLBACK


UPDATE B
SET new_innings = C.New_Inn
--SELECT B.ID,B.Inning,C.*
FROM [dbo].[Ball_by_Ball] B
INNER JOIN #Temp C
ON B.id = C.id
AND B.innings = C.inning
AND B.[over] = C.[over]
AND B.Ball = C.ball
AND B.batting_team = C.batting_team
--ORDER BY C.ID,C.batting_team,C.[OVER]

---------------
-- | Batsman with Most Runs | --
---------------

SELECT batsman,SUM(Total_Runs) Tot_Runs
	--INTO Runs_By_Batsman
FROM [dbo].[Ball_by_Ball]
GROUP BY batsman
ORDER BY SUM(Total_Runs) DESC



---------------
-- | Index Creation For Better Performance
---------------

CREATE INDEX IX_Ball_by_Ball2
ON [dbo].[Ball_by_Ball] (ID,new_innings,[Over],[ball]);


---------------
-- | Most Stamps
---------------

;WITH MostStamps
AS
(
	SELECT TOP 5 fielder WK,COUNT(1) No_Of_Stamps
	FROM [Ball_by_Ball] 
	WHERE is_wicket = 1 AND dismissal_kind = 'stumped'
	GROUP BY fielder
	ORDER BY COUNT(1) DESC
),
Stamps_Against_Players
AS
(
	SELECT fielder WK,Player_Dismissed Batsman,COUNT(1) No_Of_Stamps
	FROM [Ball_by_Ball] 
	WHERE is_wicket = 1 AND dismissal_kind = 'stumped'
	GROUP BY fielder,Player_Dismissed
	--ORDER BY fielder,COUNT(1) DESC
),
Final_Result
AS
(
SELECT M.WK,
				M.No_Of_Stamps Total_Stamps,
				S.Batsman,
				S.No_Of_Stamps Batsman_Out,
				ROW_NUMBER() OVER(PARTITION BY M.WK ORDER BY S.No_Of_Stamps DESC) RowNo
FROM MostStamps M
INNER JOIN Stamps_Against_Players S
ON M.WK = S.WK
--ORDER BY Total_Stamps DESC, Batsman_Out DESC
)
SELECT WK,Total_Stamps,Batsman,Batsman_Out No_of_StampOuts
INTO Stamp_Details
FROM Final_Result
WHERE RowNo <= 3
ORDER BY Total_Stamps DESC

SELECT * FROM Stamp_Details


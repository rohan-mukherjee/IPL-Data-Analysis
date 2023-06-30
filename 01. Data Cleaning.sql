-----------------------------------------
-------- Updating the names of teams
-----------------------------------------


BEGIN TRAN --COMMIT --ROLLBACK

UPDATE [Match_Details]
SET team1 = CASE
					WHEN Team1 = 'Chennai Super Kings' THEN 'CSK'
					WHEN Team1 = 'Deccan Chargers' THEN 'DC'
					WHEN Team1 = 'Delhi Capitals' THEN 'DD'
					WHEN Team1 = 'Delhi Daredevils' THEN 'DD'
					WHEN Team1 = 'Gujarat Lions' THEN 'GL'
					WHEN Team1 = 'Kings XI Punjab' THEN 'KXIP'
					WHEN Team1 = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN Team1 = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN Team1 = 'Mumbai Indians' THEN 'MI'
					WHEN Team1 = 'Pune Warriors' THEN 'PW'
					WHEN Team1 = 'Rajasthan Royals' THEN 'RR'
					WHEN Team1 = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN Team1 = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN Team1 = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN Team1 = 'Sunrisers Hyderabad' THEN 'SH'
					--ELSE NULL
					END


UPDATE [Match_Details]
SET team2 = CASE
					WHEN Team2 = 'Chennai Super Kings' THEN 'CSK'
					WHEN Team2 = 'Deccan Chargers' THEN 'DC'
					WHEN Team2 = 'Delhi Capitals' THEN 'DD'
					WHEN Team2 = 'Delhi Daredevils' THEN 'DD'
					WHEN Team2 = 'Gujarat Lions' THEN 'GL'
					WHEN Team2 = 'Kings XI Punjab' THEN 'KXIP'
					WHEN Team2 = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN Team2 = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN Team2 = 'Mumbai Indians' THEN 'MI'
					WHEN Team2 = 'Pune Warriors' THEN 'PW'
					WHEN Team2 = 'Rajasthan Royals' THEN 'RR'
					WHEN Team2 = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN Team2 = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN Team2 = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN Team2 = 'Sunrisers Hyderabad' THEN 'SH'
					ELSE NULL
					END



BEGIN TRAN --COMMIT --ROLLBACK

UPDATE [Match_Details]
SET toss_winner = CASE
					WHEN toss_winner = 'Chennai Super Kings' THEN 'CSK'
					WHEN toss_winner = 'Deccan Chargers' THEN 'DC'
					WHEN toss_winner = 'Delhi Capitals' THEN 'DD'
					WHEN toss_winner = 'Delhi Daredevils' THEN 'DD'
					WHEN toss_winner = 'Gujarat Lions' THEN 'GL'
					WHEN toss_winner = 'Kings XI Punjab' THEN 'KXIP'
					WHEN toss_winner = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN toss_winner = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN toss_winner = 'Mumbai Indians' THEN 'MI'
					WHEN toss_winner = 'Pune Warriors' THEN 'PW'
					WHEN toss_winner = 'Rajasthan Royals' THEN 'RR'
					WHEN toss_winner = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN toss_winner = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN toss_winner = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN toss_winner = 'Sunrisers Hyderabad' THEN 'SH'
					--ELSE NULL
					END


UPDATE [Match_Details]
SET winner = CASE
					WHEN winner = 'Chennai Super Kings' THEN 'CSK'
					WHEN winner = 'Deccan Chargers' THEN 'DC'
					WHEN winner = 'Delhi Capitals' THEN 'DD'
					WHEN winner = 'Delhi Daredevils' THEN 'DD'
					WHEN winner = 'Gujarat Lions' THEN 'GL'
					WHEN winner = 'Kings XI Punjab' THEN 'KXIP'
					WHEN winner = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN winner = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN winner = 'Mumbai Indians' THEN 'MI'
					WHEN winner = 'Pune Warriors' THEN 'PW'
					WHEN winner = 'Rajasthan Royals' THEN 'RR'
					WHEN winner = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN winner = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN winner = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN winner = 'Sunrisers Hyderabad' THEN 'SH'
					--ELSE NULL
					END

SELECT DISTINCT toss_winner FROM [dbo].[Match_Details]
SELECT DISTINCT winner FROM [dbo].[Match_Details]



BEGIN TRAN --COMMIT --ROLLBACK

UPDATE [Ball_by_Ball]
SET batting_team = CASE
					WHEN batting_team = 'Chennai Super Kings' THEN 'CSK'
					WHEN batting_team = 'Deccan Chargers' THEN 'DC'
					WHEN batting_team = 'Delhi Capitals' THEN 'DD'
					WHEN batting_team = 'Delhi Daredevils' THEN 'DD'
					WHEN batting_team = 'Gujarat Lions' THEN 'GL'
					WHEN batting_team = 'Kings XI Punjab' THEN 'KXIP'
					WHEN batting_team = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN batting_team = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN batting_team = 'Mumbai Indians' THEN 'MI'
					WHEN batting_team = 'Pune Warriors' THEN 'PW'
					WHEN batting_team = 'Rajasthan Royals' THEN 'RR'
					WHEN batting_team = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN batting_team = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN batting_team = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN batting_team = 'Sunrisers Hyderabad' THEN 'SH'
					--ELSE NULL
					END

UPDATE [Ball_by_Ball]
SET bowling_team = CASE
					WHEN bowling_team = 'Chennai Super Kings' THEN 'CSK'
					WHEN bowling_team = 'Deccan Chargers' THEN 'DC'
					WHEN bowling_team = 'Delhi Capitals' THEN 'DD'
					WHEN bowling_team = 'Delhi Daredevils' THEN 'DD'
					WHEN bowling_team = 'Gujarat Lions' THEN 'GL'
					WHEN bowling_team = 'Kings XI Punjab' THEN 'KXIP'
					WHEN bowling_team = 'Kochi Tuskers Kerala' THEN 'KTK'
					WHEN bowling_team = 'Kolkata Knight Riders' THEN 'KKR'
					WHEN bowling_team = 'Mumbai Indians' THEN 'MI'
					WHEN bowling_team = 'Pune Warriors' THEN 'PW'
					WHEN bowling_team = 'Rajasthan Royals' THEN 'RR'
					WHEN bowling_team = 'Rising Pune Supergiant' THEN 'RRP'
					WHEN bowling_team = 'Rising Pune Supergiants' THEN 'RRP'
					WHEN bowling_team = 'Royal Challengers Bangalore' THEN 'RCB'
					WHEN bowling_team = 'Sunrisers Hyderabad' THEN 'SH'
					--ELSE NULL
					END


SELECT DISTINCT batting_team FROM [dbo].[Ball_by_Ball]
SELECT DISTINCT bowling_team FROM [dbo].[Ball_by_Ball]

-----------------------------------------
-------- Checking Duplicates
-----------------------------------------

SELECT ID,COUNT(1)
FROM [dbo].[Match_Details]
GROUP BY ID
HAVING COUNT(1) > 1


-----------------------------------------
-------- Checking for data Loss
-----------------------------------------

SELECT *
FROM [Match_Details] M
INNER JOIN [Ball_by_Ball] B
ON M.id = B.id

SELECT COUNT(DISTINCT ID) FROM [Match_Details] M WHERE ID NOT IN (SELECT ID FROM [dbo].[Ball_by_Ball])
SELECT COUNT(DISTINCT ID) FROM [Ball_by_Ball] WHERE ID NOT IN (SELECT ID FROM [dbo].[Match_Details])



-----------------------------------------
-------- Adding Constrains
-----------------------------------------

ALTER TABLE [Match_Details]
ALTER COLUMN ID nVarchar(100) NOT NULL;

ALTER TABLE [Ball_by_Ball]
ALTER COLUMN ID nVarchar(100) NOT NULL;

ALTER TABLE [Match_Details]
ADD PRIMARY KEY(ID)

ALTER TABLE [Ball_by_Ball]
ADD CONSTRAINT FK_Match_Details_Ball_by_Ball
FOREIGN KEY (id) REFERENCES [Match_Details](id);



-----------------------------------------
-------- Changing Grounds Name
-----------------------------------------


SELECT CASE
					WHEN venue = 'Barabati Stadium' THEN 'Barabati'
					WHEN venue = 'Brabourne Stadium' THEN 'Brabourne'
					WHEN venue = 'De Beers Diamond Oval' THEN 'D.Beers'
					WHEN venue = 'Dr DY Patil Sports Academy' THEN 'DY Patil'
					WHEN venue = 'Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium' THEN 'Reddy'
					WHEN venue = 'Dubai International Cricket Stadium' THEN 'Dubai Int'
					WHEN venue = 'Eden Gardens' THEN 'Eden'
					WHEN venue = 'Feroz Shah Kotla' THEN 'Kotla'
					WHEN venue = 'Green Park' THEN 'Green P'
					WHEN venue = 'Himachal Pradesh Cricket Association Stadium' THEN 'HMPCA'
					WHEN venue = 'Holkar Cricket Stadium' THEN 'Holkar'
					WHEN venue = 'JSCA International Stadium Complex' THEN 'JSCA'
					WHEN venue = 'M Chinnaswamy Stadium' THEN 'Chinnaswamy'
					WHEN venue = 'M.Chinnaswamy Stadium' THEN 'Chinnaswamy'
					WHEN venue = 'MA Chidambaram Stadium, Chepauk' THEN 'Chepauk'
					WHEN venue = 'Maharashtra Cricket Association Stadium' THEN 'MCAS'
					WHEN venue = 'Nehru Stadium' THEN 'Nehru'
					WHEN venue = 'New Wanderers Stadium' THEN 'Wanderers'
					WHEN venue = 'OUTsurance Oval' THEN 'OS Oval'
					WHEN venue = 'Punjab Cricket Association IS Bindra Stadium, Mohali' THEN 'Mohali'
					WHEN venue = 'Punjab Cricket Association Stadium, Mohali' THEN 'Mohali'
					WHEN venue = 'Rajiv Gandhi International Stadium, Uppal' THEN 'Uppal'
					WHEN venue = 'Sardar Patel Stadium, Motera' THEN 'Motera'
					WHEN venue = 'Saurashtra Cricket Association Stadium' THEN 'Saurashtra'
					WHEN venue = 'Sawai Mansingh Stadium' THEN 'Mansingh'
					WHEN venue = 'Shaheed Veer Narayan Singh International Stadium' THEN 'V.Narayan'
					WHEN venue = 'Sharjah Cricket Stadium' THEN 'Sharjah'
					WHEN venue = 'Sheikh Zayed Stadium' THEN 'SK.Zayed'
					WHEN venue = 'St George''s Park' THEN 'St George'
					WHEN venue = 'Subrata Roy Sahara Stadium' THEN 'Sahara'
					WHEN venue = 'SuperSport Park' THEN 'SuperSport'
					WHEN venue = 'Vidarbha Cricket Association Stadium, Jamtha' THEN 'Vidarbha'
					WHEN venue = 'Wankhede Stadium' THEN 'Wankhede'
					ELSE venue
				END
FROM (SELECT DISTINCT venue FROM [dbo].[Match_Details]) M




UPDATE [dbo].[Match_Details]
SET venue = 
		CASE
					WHEN venue = 'Barabati Stadium' THEN 'Barabati'
					WHEN venue = 'Brabourne Stadium' THEN 'Brabourne'
					WHEN venue = 'De Beers Diamond Oval' THEN 'D.Beers'
					WHEN venue = 'Dr DY Patil Sports Academy' THEN 'DY Patil'
					WHEN venue = 'Dr. Y.S. Rajasekhara Reddy ACA-VDCA Cricket Stadium' THEN 'Reddy'
					WHEN venue = 'Dubai International Cricket Stadium' THEN 'Dubai Int'
					WHEN venue = 'Eden Gardens' THEN 'Eden'
					WHEN venue = 'Feroz Shah Kotla' THEN 'Kotla'
					WHEN venue = 'Green Park' THEN 'Green P'
					WHEN venue = 'Himachal Pradesh Cricket Association Stadium' THEN 'HMPCA'
					WHEN venue = 'Holkar Cricket Stadium' THEN 'Holkar'
					WHEN venue = 'JSCA International Stadium Complex' THEN 'JSCA'
					WHEN venue = 'M Chinnaswamy Stadium' THEN 'Chinnaswamy'
					WHEN venue = 'M.Chinnaswamy Stadium' THEN 'Chinnaswamy'
					WHEN venue = 'MA Chidambaram Stadium, Chepauk' THEN 'Chepauk'
					WHEN venue = 'Maharashtra Cricket Association Stadium' THEN 'MCAS'
					WHEN venue = 'Nehru Stadium' THEN 'Nehru'
					WHEN venue = 'New Wanderers Stadium' THEN 'Wanderers'
					WHEN venue = 'OUTsurance Oval' THEN 'OS Oval'
					WHEN venue = 'Punjab Cricket Association IS Bindra Stadium, Mohali' THEN 'Mohali'
					WHEN venue = 'Punjab Cricket Association Stadium, Mohali' THEN 'Mohali'
					WHEN venue = 'Rajiv Gandhi International Stadium, Uppal' THEN 'Uppal'
					WHEN venue = 'Sardar Patel Stadium, Motera' THEN 'Motera'
					WHEN venue = 'Saurashtra Cricket Association Stadium' THEN 'Saurashtra'
					WHEN venue = 'Sawai Mansingh Stadium' THEN 'Mansingh'
					WHEN venue = 'Shaheed Veer Narayan Singh International Stadium' THEN 'V.Narayan'
					WHEN venue = 'Sharjah Cricket Stadium' THEN 'Sharjah'
					WHEN venue = 'Sheikh Zayed Stadium' THEN 'SK.Zayed'
					WHEN venue = 'St George''s Park' THEN 'St George'
					WHEN venue = 'Subrata Roy Sahara Stadium' THEN 'Sahara'
					WHEN venue = 'SuperSport Park' THEN 'SuperSport'
					WHEN venue = 'Vidarbha Cricket Association Stadium, Jamtha' THEN 'Vidarbha'
					WHEN venue = 'Wankhede Stadium' THEN 'Wankhede'
					ELSE venue
				END
FROM [dbo].[Match_Details]


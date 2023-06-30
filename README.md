# IPL-Data-Analysis
This is analysis is to find out the insights from IPL datasets between 2008 to 2020

Tool Used : 
  1. Python for Web Scrapping
  2. SQL Server
  3. Visual Studio
  4. SSIS
  5. PowerBI
  6. Excel

Main Data File : 
  1. IPL Ball-by-Ball 2008-2020
  2. IPL Matches 2008-2020

Steps : 
  1. 1st Generate the data from IPL Main Website (“https://www.iplt20.com/”)
  2. Load CSV file to Excel & change the file format to 2007-2014 Excel file.
  3. Create a New Database So that we can load the data into it through ETL package
  4. Create SSIS package to load the data into DB.
  5. Primary key & Indexing
  6. Data Cleaning
  7. Load The data Into PowerBI
  8. Create data Modeling

Folder Details :
  1. Analysis Snapshot : Power BI analysis Snapshot of 1st 3 pages
  2. SQL Queries : Contains all SQL Queries for analysis
  3. SSIS Package : Contains all ETL Packages to laod the dat ainto Database
  4. Table Creation Script : Contins those script for creating main tables in DB
  5. Walpaper : PowerBI background walpaper.

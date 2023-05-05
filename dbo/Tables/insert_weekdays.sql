SELECT *
FROM
    bellabeat_capstone.dbo.daily_activity

-- how to add column with converted value of the ActivityDate to monday to sunday

--I need to add new column in which it contains the coresponding day of the week

SELECT
    DATEPART(WEEK, ActivityDate) AS Week 
FROM
    bellabeat_capstone.dbo.daily_activity;


-- Convert the ActivityDate column to weekdays
SELECT
    DATENAME(WEEKDAY, ActivityDate) AS Weekday
FROM
    bellabeat_capstone.dbo.daily_activity;


-- Will create a temporary table to combine my two SQL statements
SELECT
    DATEPART(WEEK, ActivityDate) AS Week, DATENAME(WEEKDAY, ActivityDate) AS Weekday
INTO #Weekdays
FROM
    bellabeat_capstone.dbo.daily_activity;



/*Next is I need to create a mapping table to 
convert the format of ActivityDate to new column with corresponding weekdays*/

CREATE TABLE #Weekdays_mapping (Weekday VARCHAR(20), Weekday_Mon_To_Sun VARCHAR(20))
INSERT INTO #Weekdays_mapping VALUES 
('Monday', 'Monday'),
('Tuesday', 'Tuesday'),
('Wednesday', 'Wednesday'),
('Thursday', 'Thursday'),
('Friday', 'Friday'),
('Saturday', 'Saturday'),
('Sunday', 'Sunday');


-- Join the two tables together

UPDATE #Weekdays
SET Weekday = wd.Weekday_Mon_To_Sun
FROM #Weekdays d
JOIN #Weekdays_mapping wd ON d.Weekday = wd.Weekday;


-- Insert new column in daily_activity table


ALTER TABLE bellabeat_capstone.dbo.daily_activity
ADD Weekday_Mon_To_Sun VARCHAR(20) 

UPDATE bellabeat_capstone.dbo.daily_activity
SET Weekday_Mon_To_Sun = #Weekdays.Weekday
FROM #Weekdays
WHERE #Weekdays.Week = #Weekdays.Week;

-- Delete the temporary table
DROP TABLE #Weekdays
DROP TABLE #Weekdays_mapping
GO;

-- Check the new column
SELECT *
FROM
    bellabeat_capstone.dbo.daily_activity;

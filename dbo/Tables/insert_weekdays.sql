SELECT *
FROM
    bellabeat_capstone.dbo.daily_activity

-- how to add column with converted value of the ActivityDate to monday to sunday

--I need to add new column in which it contains the coresponding day of the week


ALTER TABLE bellabeat_capstone.dbo.daily_activity
ADD Weekday_Mon_To_Sun VARCHAR(20);

UPDATE bellabeat_capstone.dbo.daily_activity
SET Weekday_Mon_To_Sun = DATENAME(WEEKDAY, ActivityDate);

-- I will also add new column with corresponding weekday to daily_steps and daily_sleep datasets


ALTER TABLE bellabeat_capstone.dbo.daily_sleep
ADD Weekday_Mon_To_Sun VARCHAR(20);

UPDATE bellabeat_capstone.dbo.daily_sleep
SET Weekday_Mon_To_Sun = DATENAME(WEEKDAY, Date);


ALTER TABLE bellabeat_capstone.dbo.daily_steps
ADD Weekday_Mon_To_Sun VARCHAR(20);

UPDATE bellabeat_capstone.dbo.daily_steps
SET Weekday_Mon_To_Sun = DATENAME(WEEKDAY, ActivityDay);



/*SQL below is too complicated so I tried to come up with a simple
and easy one... I remember a lot of Data Analyst always say that 
complicated code is not ideal. 
*/

/* I'll still include this here so that I can go back and
figure out the blocker once I'm done with my capstone :) */

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
('Monday','Monday'),
('Tuesday','Tuesday'),
('Wednesday','Wednesday'),
('Thursday','Thursday'),
('Friday','Friday'),
('Saturday','Saturday'),
('Sunday','Sunday');


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
WHERE bellabeat_capstone.dbo.daily_activity.Weekday_Mon_To_Sun = #Weekdays.Week;

-- Delete the temporary table
DROP TABLE #Weekdays
DROP TABLE #Weekdays_mapping



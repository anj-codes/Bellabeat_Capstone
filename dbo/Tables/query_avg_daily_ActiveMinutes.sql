-- I wanted to narrow down my result by getting the average active minutes (from daily_activity dataset) in each day.

SELECT
   Weekday_Mon_To_Sun,
   AVG(VeryActiveMinutes) AS avg_very_active_minutes,
   AVG(LightlyActiveMinutes) AS avg_lightly_active_minutes,
   AVG(FairlyActiveMinutes) AS avg_fairly_active_minutes,
   AVG(SedentaryMinutes) AS avg_sedentary_minutes
FROM 
    bellabeat_capstone.dbo.daily_activity
    GROUP BY Weekday_Mon_To_Sun;




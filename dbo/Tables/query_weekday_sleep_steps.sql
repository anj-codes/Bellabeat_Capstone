-- What day of the week do the users sleep more

SELECT
    AVG(TotalMinutesAsleep) as avg_daily_sleep,
    Weekday_Mon_To_Sun
FROM
    bellabeat_capstone.dbo.daily_sleep
    GROUP BY Weekday_Mon_To_Sun
    ORDER BY 
        CASE Weekday_Mon_To_Sun
            WHEN 'Monday' THEN 1
            WHEN 'Tuesday' THEN 2
            WHEN 'Wednesday' THEN 3
            WHEN 'Thursday' THEN 4
            WHEN 'Friday' THEN 5
            WHEN 'Saturday' THEN 6
            ELSE 7  
        END;



-- What day of the week are the users more active 


SELECT
    AVG(StepTotal) as daily_steps,
    Weekday_Mon_To_Sun
FROM
    bellabeat_capstone.dbo.daily_steps
    GROUP BY Weekday_Mon_To_Sun
    ORDER BY 
        CASE Weekday_Mon_To_Sun
            WHEN 'Monday' THEN 1
            WHEN 'Tuesday' THEN 2
            WHEN 'Wednesday' THEN 3
            WHEN 'Thursday' THEN 4
            WHEN 'Friday' THEN 5
            WHEN 'Saturday' THEN 6
            ELSE 7  
        END;

    


 
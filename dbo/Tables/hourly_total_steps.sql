-- I want to know when are the users more active within a day

SELECT 
    [Hour],
    COUNT (StepTotal) AS total_hourly_steps
FROM 
    bellabeat_capstone.dbo.hourly_steps
    GROUP BY [Hour]
-- I want to know when are the users more active within a day

SELECT 
    [Hour],
    SUM(StepTotal) AS total_hourly_steps
FROM 
    bellabeat_capstone.dbo.hourly_steps
    GROUP BY [Hour]

-- I want to see the time with highest total steps

SELECT 
    [Hour],
    SUM(StepTotal) AS total_hourly_steps
FROM 
    bellabeat_capstone.dbo.hourly_steps
    GROUP BY [Hour]
    ORDER BY total_hourly_steps DESC
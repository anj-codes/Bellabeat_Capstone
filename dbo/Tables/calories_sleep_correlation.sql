-- I want to see the correlation between calories and steps

SELECT 
    dbo.daily_calories.Calories,
    dbo.daily_steps.StepTotal
FROM 
    bellabeat_capstone.dbo.daily_calories
JOIN daily_steps ON dbo.daily_calories.ActivityDay = dbo.daily_steps.ActivityDay;
---One of the limitation of the Fitbit Fitness Tracker data is that the users have no demographic variables,*/
---Which can help us distinct the characteristics of the sample population*/


---I will be classifying the users based on their daily steps as their level of activity.

SELECT
    Id,
    AVG(StepTotal) avg_daily_steps,
    CASE
        WHEN AVG(StepTotal) <=5000 THEN 'Inactive user'
        WHEN AVG(StepTotal) <=7499 THEN 'Low active user'
        WHEN AVG(StepTotal) <=9999 THEN 'Average active user'
        WHEN AVG(StepTotal) >=10000 THEN 'Very active user'
        END AS user_type
FROM
    bellabeat_capstone.dbo.daily_steps 
    GROUP BY Id;

-- I wanted to see the number of users in each category.

SELECT
    user_type,
    COUNT(*) AS user_count
 FROM 
 (
SELECT
    Id,
    AVG(StepTotal) avg_daily_steps,
    CASE
        WHEN AVG(StepTotal) <=5000 THEN 'Inactive user'
        WHEN AVG(StepTotal) <=7499 THEN 'Low active user'
        WHEN AVG(StepTotal) <=9999 THEN 'Average active user'
        WHEN AVG(StepTotal) >=10000 THEN 'Very active user'
        END AS user_type
FROM
    bellabeat_capstone.dbo.daily_steps 
    GROUP BY Id
 ) subquery
 GROUP BY user_type;
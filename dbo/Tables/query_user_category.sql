/*The main focus of this query is to categorized users based on how often they weair their tracker.*/
/*Doing this, I can use this data to better understand the users behavior and see if there are correlations to other datasets.*/

/*Count all the unique participants. */
SELECT 
    COUNT(DISTINCT (Id)) as  total_unique_id
FROM
    bellabeat_capstone.dbo.daily_activity;

/*I wanted to know how many times each participants use their tracker. */

SELECT 
    Id,
    COUNT(ActivityDate) as total_tracked
FROM
    bellabeat_capstone.dbo.daily_activity
    GROUP BY Id;

/*Next I wanted to breakdown the users into three criteria based on how often they wear their tracker:*/

SELECT
    Id,
    COUNT(ActivityDate) AS total_tracked,
  CASE 
    WHEN  COUNT(ActivityDate) BETWEEN 25 AND 31 THEN 'Always'
    WHEN  COUNT(ActivityDate) BETWEEN 11 AND 24 THEN 'Moderate'
    WHEN  COUNT(ActivityDate) BETWEEN 0 AND 10 THEN 'Sometimes'
  END AS wearing_tracker
FROM 
    bellabeat_capstone.dbo.daily_activity
    GROUP BY Id;

/* get the counts of users who are categorized as 'Active', 'Moderate', and 'Sometimes' */

SELECT 
    wearing_tracker,
    COUNT(*) AS user_count
FROM 
(
    SELECT
        Id,
        COUNT(ActivityDate) AS total_tracked,
        CASE 
            WHEN COUNT(ActivityDate) BETWEEN 25 AND 31 THEN 'Always'
            WHEN COUNT(ActivityDate) BETWEEN 11 AND 24 THEN 'Moderate'
            WHEN COUNT(ActivityDate) BETWEEN 0 AND 10 THEN 'Sometimes'
        END AS wearing_tracker
    FROM bellabeat_capstone.dbo.daily_activity
    GROUP BY Id
) subquery
GROUP BY wearing_tracker;
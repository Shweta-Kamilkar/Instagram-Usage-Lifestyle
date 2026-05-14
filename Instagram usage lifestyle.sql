select * from instagram_usage_lifestyle  limit 100;
  
-- Q1 Find top 10 Highly Engaged Users
SELECT user_id, user_engagement_score
FROM instagram_usage_lifestyle
ORDER BY user_engagement_score DESC
LIMIT 10;

-- Q2 Find average Engagement by Country
SELECT country, AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY country
ORDER BY avg_engagement DESC;

-- Q3 Fetch the data Engagement by Gender
SELECT gender, AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY gender;

-- Q4 Find the data Impact of Posting Frequency
SELECT posts_created_per_week,
       AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY posts_created_per_week
ORDER BY posts_created_per_week;

-- Q5 Fetch the data of Reels Watch Per Week Time vs Engagement score
SELECT 
    CASE 
        WHEN time_on_reels_per_day < 1 THEN 'Low'
        WHEN time_on_reels_per_day BETWEEN 1 AND 3 THEN 'Medium'
        ELSE 'High'
    END AS reels_category,
    AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY reels_category;

-- Q6 Fetch data of Followers vs Engagement
SELECT 
    CASE 
        WHEN followers_count < 1000 THEN 'Low Followers'
        WHEN followers_count BETWEEN 1000 AND 10000 THEN 'Medium Followers'
        ELSE 'High Followers'
    END AS follower_group,
    AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY follower_group;

-- Q7 Fetch the data Active vs Inactive Users
SELECT 
    CASE 
        WHEN sessions_per_day > 2 THEN 'Active'
        ELSE 'Inactive'
    END AS user_type,
    COUNT(*) AS total_users
FROM instagram_usage_lifestyle
GROUP BY user_type;

-- Q8 Fetch the data Notification Response Impact

SELECT 
    CASE 
        WHEN notification_response_rate > 0.7 THEN 'High Response'
		WHEN notification_response_rate BETWEEN 0.3 AND 0.7 THEN 'Medium Response'
        ELSE 'Low Response'
    END AS response_group,
    avg(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY response_group;

-- Q9 Fetch the data of Subscription vs Free Users

SELECT subscription_status,
       AVG(user_engagement_score) AS avg_engagement
FROM instagram_usage_lifestyle
GROUP BY subscription_status;

-- Q10 Fetch the data of Monthly User Growth (Approx)
SELECT account_creation_year,
       COUNT(*) AS total_users
FROM instagram_usage_lifestyle
GROUP BY account_creation_year
ORDER BY account_creation_year;
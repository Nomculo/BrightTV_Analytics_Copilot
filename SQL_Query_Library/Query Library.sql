-- Databricks notebook source
--------------------------------------------------------------------------------------------
----------------SUBSCRIBER ANALYSIS--------------------------------------------
------------------------------------------------------------


Q1: How many subscribers does Bright Tv have?
select count(*) as total_subsribers
from bright_tv_dataset.bright_tv.user_profiles_dataset;
--------------------------------------------------------

Q2: Which province has the highest number of subscribers?
select province,
    count(*) as total_subscribers
from bright_tv_dataset.bright_tv.user_profiles_dataset
group by province
order by total_subscribers desc;
---------------------------------------------------------

Q3: What is the gender distribution of subscribers?
select distinct gender
from bright_tv_dataset.bright_tv.user_profiles_dataset;
---------------------------------------------------------

Q4: What is the race distribution?
SELECT
    race,
    COUNT(*) AS Total_Subscribers
FROM bright_tv_dataset.bright_tv.user_profiles_dataset
GROUP BY race
ORDER BY Total_Subscribers DESC;
-----------------------------------------------------------

Q5: Which province has the most subscribers?
select province,
    count(*) as total_subscribers
from bright_tv_dataset.bright_tv.user_profiles_dataset
group by province
order by total_subscribers desc;
-----------------------------------------------------------

Q6: What is the average subscriber age?
SELECT
    AVG(Age) AS Average_Age
FROM bright_tv_dataset.bright_tv.user_profiles_dataset;



----------------------------------------------------------------------------------------------------------------
----------------------------VIEWERSHIP ANALYSIS-------------------------------------------------
---------------------------------------------------------------------------------------------

Q1: Which channels are watched the most?
SELECT
    Channel2,
    COUNT(*) AS Total_Views
FROM bright_tv_dataset.bright_tv.viewership_dataset
GROUP BY Channel2
ORDER BY Total_Views DESC;
-----------------------------------------------------------

Q2: Which days have the highest viewing activity?
SELECT
    DAYNAME(RecordDate2) AS Day_Name,
    COUNT(*) AS Total_Views
FROM bright_tv_dataset.bright_tv.viewership_dataset
GROUP BY DAYNAME(RecordDate2)
ORDER BY Total_Views DESC;
----------------------------------------------------------

Q3: Do BrightTV subscribers watch more during weekdays or weekends?
SELECT
    CASE
        WHEN DAYNAME(RecordDate2) IN ('Mon','Tue','Wed','Thu','Fri')
            THEN 'Weekday'
        ELSE 'Weekend'
    END AS Day_Type,
    COUNT(*) AS Total_Views
FROM bright_tv_dataset.bright_tv.viewership_dataset
GROUP BY
    CASE
        WHEN DAYNAME(RecordDate2) IN ('Mon','Tue','Wed','Thu','Fri')
            THEN 'Weekday'
        ELSE 'Weekend'
    END;
    ------------------------------------------------------------------------------------

Q4: What are the peak viewing hours for BrightTV subscribers?
SELECT
    HOUR(RecordDate2) AS Viewing_Hour,
    COUNT(*) AS Total_Views
FROM bright_tv_dataset.bright_tv.viewership_dataset
GROUP BY HOUR(RecordDate2)
ORDER BY Total_Views DESC;
-------------------------------------------------------------------------

Q5: How does BrightTV viewership change over time by month?
SELECT
    DATE_FORMAT(RecordDate2,'yyyy-MM') AS Month,
    COUNT(*) AS Total_Views
FROM bright_tv_dataset.bright_tv.viewership_dataset
GROUP BY DATE_FORMAT(RecordDate2,'yyyy-MM')
ORDER BY Month;


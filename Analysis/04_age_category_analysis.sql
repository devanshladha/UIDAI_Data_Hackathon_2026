# State-wise enrolment for children (age 0–5)
SELECT
    state_clean,
    SUM(age_0_5) AS age_0_5_total
FROM Enrolment
GROUP BY state_clean
ORDER BY age_0_5_total DESC;

#  State-wise enrolment for children (age 5–17)
SELECT
    state_clean,
    SUM(age_5_17) AS age_5_17_total
FROM Enrolment
GROUP BY state_clean
ORDER BY age_5_17_total DESC;

# State-wise enrolment for adults (18+)
SELECT
    state_clean,
    SUM(age_18_greater) AS adult_total
FROM Enrolment
GROUP BY state_clean
ORDER BY adult_total DESC;

# district wise (0-5)
select district_clean,
       sum(age_0_5)
from Enrolment
GROUP BY district_clean;

# district wise (5-17)
select district_clean,
       sum(age_5_17)
from Enrolment
GROUP BY district_clean;

# district wise (18+)
select district_clean,
       sum(age_18_greater)
from Enrolment
GROUP BY district_clean;


## percentage of enrolment per category in whole dataset
with total as (
select sum(age_5_17) as 5_17,
       sum(age_0_5) as under_5,
       sum(age_18_greater) as adult from Enrolment)
select under_5/(under_5 + 5_17 + adult)*100,
       5_17/(under_5 + 5_17 + adult)*100,
       adult/(under_5 + 5_17 + adult)*100
from total;
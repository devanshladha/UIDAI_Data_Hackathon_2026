# percentage of missing data of all datasets, every month
WITH MonthlyCounts AS (
    SELECT
        month(date_new) as month_num,
        day(last_day(date_new)) as days_in_month,
        count(distinct date_new) as E_count
    FROM Enrolment
    GROUP BY 1, 2
),
Demo AS (
    SELECT month(date_new) as month_num, count(distinct date_new) as D_count
    FROM Demographic GROUP BY 1
),
Bio AS (
    SELECT month(date_new) as month_num, count(distinct date_new) as B_count
    FROM Biometric GROUP BY 1
)

SELECT
    m.month_num,
    round(100.0 - (m.E_count * 100.0 / m.days_in_month), 2) as enrol_missing_pct,
    round(100.0 - (coalesce(d.D_count, 0) * 100.0 / m.days_in_month), 2) as demo_missing_pct,
    round(100.0 - (coalesce(b.B_count, 0) * 100.0 / m.days_in_month), 2) as bio_missing_pct
FROM MonthlyCounts m
LEFT JOIN Demo d ON m.month_num = d.month_num
LEFT JOIN Bio b ON m.month_num = b.month_num;



##    number of districts enrolled per month
select month(date_new),count(distinct district_clean)
from Enrolment
group by month(date_new);

## number of districts enrolled per state
select state_clean,count(distinct state_clean)
from Enrolment
group by state_clean;


#    states enrolled every month
SELECT
    state_clean,sum(age_0_5+age_5_17+age_18_greater)
FROM Enrolment
GROUP BY state_clean
HAVING COUNT(DISTINCT DATE_FORMAT(date_new, '%Y-%m')) =
       (
           SELECT COUNT(DISTINCT DATE_FORMAT(date_new, '%Y-%m'))
           FROM Enrolment
       );
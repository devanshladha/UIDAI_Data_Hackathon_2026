# percentage of missing date in all datasets, every month
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

## percentage of enrolment per category in whole dataset
with total as (
select sum(age_5_17) as 5_17,sum(age_0_5) as under_5,sum(age_18_greater) as adult from Enrolment)
select under_5/(under_5 + 5_17 + adult)*100,
       5_17/(under_5 + 5_17 + adult)*100,
       adult/(under_5 + 5_17 + adult)*100
from total;
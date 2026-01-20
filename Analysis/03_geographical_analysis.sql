# total enrolments in whole dataset
select sum(age_0_5+Enrolment.age_5_17+Enrolment.age_18_greater)
from Enrolment;

# Total enrolment per state
SELECT
    state_clean,
    SUM(
        age_0_5 +
        age_5_17 +
        age_18_greater
    ) AS total_enrolment
FROM Enrolment
GROUP BY state_clean
ORDER BY total_enrolment DESC;


# Total enrolment per district
SELECT
    district_clean,
    SUM(
        age_0_5 +
        age_5_17 +
        age_18_greater
    ) AS total_enrolment
FROM Enrolment
GROUP BY district_clean
ORDER BY total_enrolment DESC;


#   Districts with zero total enrolment
SELECT
    district_clean
FROM Enrolment
GROUP BY district_clean
HAVING SUM(
    age_0_5+
    age_5_17 +
    age_18_greater
) = 0;


 # PinCodes with zero total enrolment
SELECT
    pincode
FROM Enrolment
GROUP BY pincode
HAVING SUM(
    age_0_5 +
    age_5_17+
    age_18_greater
) = 0;


#   Number of districts enrolled per state
SELECT
    state_clean,
    COUNT(DISTINCT district_clean) AS district_count
FROM Enrolment
GROUP BY state_clean
ORDER BY district_count DESC;


#   States that have enrolment records in every available month
SELECT
    state_clean
FROM Enrolment
GROUP BY state_clean
HAVING COUNT(DISTINCT DATE_FORMAT(date_new, '%Y-%m')) =
       (
           SELECT COUNT(DISTINCT DATE_FORMAT(date_new, '%Y-%m'))
           FROM Enrolment
       );

# Biometric
select state_clean,
       sum(bio_age_5_17+bio_age_5_17_)
from Biometric
group by state_clean;


select state_clean,
       sum(bio_age_5_17)
from Biometric
group by state_clean;


select state_clean,
       sum(bio_age_5_17_)
from Biometric
group by state_clean;


select district_clean,
       sum(bio_age_5_17+bio_age_5_17_)
from Biometric
group by district_clean;


select district_clean,
       sum(bio_age_5_17)
from Biometric
group by district_clean;


select district_clean,
       sum(bio_age_5_17_)
from Biometric
group by district_clean;
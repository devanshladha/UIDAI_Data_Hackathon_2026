select count(is_duplicate) from Enrolment
where is_duplicate=0;

select count(is_duplicate) from Enrolment
where is_duplicate=1;

select count(is_duplicate) from Biometric
where is_duplicate=0;

select count(is_duplicate) from Biometric
where is_duplicate=1;

select count(is_duplicate) from Demographic
where is_duplicate=0;

select count(is_duplicate) from Demographic
where is_duplicate=1;

# delete duplicate rows(WARNING!)
delete from Biometric where is_duplicate=1;

# delete duplicate rows(WARNING!)
delete from Enrolment where is_duplicate=1;

# delete duplicate rows(WARNING!)
delete from Demographic where is_duplicate=1;



select count(*) from Enrolment;
select count(*) from Biometric;
select count(*) from Demographic;

select count(distinct state_clean)
from Enrolment;

select count(distinct state_clean)
from Biometric;

select count(distinct state_clean)
from Demographic;

select count(distinct district_clean)
from Enrolment;

select count(distinct district_clean)
from Biometric;

select count(distinct district_clean)
from Demographic;

select count(is_duplicate) from Enrolment
where is_duplicate=1;

select count(is_duplicate) from Biometric
where is_duplicate=1;

select count(is_duplicate) from Demographic
where is_duplicate=1;

select * from Enrolment
where date is null;

select * from Biometric
where date is null;

select * from Demographic
where date is null;


select count(distinct month(date_new)) from Enrolment;
select count(distinct month(date_new)) from Biometric;
select count(distinct month(date_new)) from Demographic;
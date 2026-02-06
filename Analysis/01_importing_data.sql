# IMPORTING DATA IN MySQL
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;

# Enrolment
CREATE TABLE Enrolment(
    date TEXT,
    state VARCHAR(100) null,
    district VARCHAR(100) null,
    pincode INT null,
    age_0_5 INT null,
    age_5_17 INT null,
    age_18_greater INT null,
    state_clean VARCHAR(100) null,
    district_clean VARCHAR(100) null,
    is_duplicate boolean null
);

LOAD DATA LOCAL INFILE '../Visualization/enrolment/final_data.csv'
INTO TABLE Enrolment
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# BIOMETRIC
CREATE TABLE Biometric(
    date TEXT,
    state VARCHAR(100) null,
    district VARCHAR(100) null,
    pincode INT null,
    bio_age_5_17 INT null,
    bio_age_5_17_ INT null,
    state_clean VARCHAR(100) null,
    district_clean VARCHAR(100) null,
    is_duplicate boolean null
);
LOAD DATA LOCAL INFILE '../Visualization/biometric/final_data.csv'
INTO TABLE Biometric
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

#DEMOGRAPHIC
CREATE TABLE Demographic(
    date TEXT,
    state VARCHAR(100) null,
    district VARCHAR(100) null,
    pincode INT null,
    demo_age_5_17 INT null,
    demo_age_5_17_ INT null,
    state_clean VARCHAR(100) null,
    district_clean VARCHAR(100) null,
    is_duplicate boolean null
);
LOAD DATA LOCAL INFILE '../Visualization/demographic/final_data.csv'
INTO TABLE Demographic
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

# creating a date_new column in Biometric,demographic and enrolment
ALTER TABLE Enrolment
ADD COLUMN date_new DATE NULL;
UPDATE ignore Enrolment
SET date_new = STR_TO_DATE(date, '%d-%m-%y');

ALTER TABLE Biometric
ADD COLUMN date_new DATE NULL;
UPDATE ignore Biometric
SET date_new = STR_TO_DATE(date, '%d-%m-%y');

ALTER TABLE Demographic
ADD COLUMN date_new DATE NULL;
UPDATE ignore Demographic
SET date_new = STR_TO_DATE(date, '%d-%m-%y');

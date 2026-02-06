# UIDAI Data Hackathon 2026 – Aadhaar Enrolment & Update Analytics

**Team ID:** UIDAI_1336  
**Event:** UIDAI Data Hackathon 2026  
**Team Detail**
- **Devansh Ladha** ( [@devanshladha](https://github.com/devanshladha) )
- **Akshat Jain** ( [@Akshat-jain737](https://github.com/Akshat-jain737) )

## Overview
This project performs a large-scale analytical study on Aadhaar Enrolment and Update datasets published by the Unique Identification Authority of India (UIDAI).  
The objective is to extract **patterns, trends, anomalies, and predictive indicators** that can support **data-driven decision-making**, improve **service delivery**, and enhance **operational efficiency** within UIDAI systems .

The analysis spans **enrolments, biometric updates, and demographic updates**, segmented by **state, district, pincode, age group, time (month/year), and UIDAI Regional Offices**.

---

## Problem Statement
The core challenge is to transform raw UIDAI operational data into **actionable insights** by:
- Identifying spatial and temporal enrolment/update patterns  
- Detecting anomalies and outliers across regions and age groups  
- Highlighting operational inefficiencies and late-enrolment trends  
- Supporting evidence-based policy and administrative decisions 

---

## Datasets Used
Source: **UIDAI Aadhaar Enrolment and Update Dataset**

### Dataset Summary
| Dataset | Records | Key Columns |
|------|--------|------------|
| Enrolment | 1,006,029 | Date, State, District, Pincode, age_0_5, age_5_17, age_18_greater |
| Demographic | 1,861,108 | Date, State, District, Pincode, demo_age_5_17, demo_age_17_plus |
| Biometric | 2,071,698 | Date, State, District, Pincode, bio_age_5_17, bio_age_17_plus |

:contentReference[oaicite:2]{index=2}

---

## Tools & Technologies
- **Python**: Data preprocessing, EDA, visualization  
- **Pandas / NumPy**: Data manipulation  
- **Matplotlib / Seaborn**: Visual analytics  
- **MySQL**: Insight extraction using SQL queries  
- **Google Colab**: Execution environment  
- **MySQL Workbench**: Querying and validation 

---

## Methodology

### 1. Data Preprocessing
- Concatenated multiple CSV batches into unified datasets  
- Normalized state and district names (case, spacing, symbols, hyphens)  
- Standardized deprecated and inconsistent state names  
  - Example: *Orissa → Odisha*, *Pondicherry → Puducherry*  
- Converted date fields from string to date format  
- Identified and flagged duplicate rows using `is_duplicate`  
- Retained only unique records for analysis  
- Added **Regional Office mapping** based on UIDAI official references

### 2. Exploratory Data Analysis (EDA)
- Verified absence of null values  
- Validated data types across all columns  
- Identified data coverage: **Year 2025 (9 months; Jan, Feb, Aug missing)**  
- Analyzed duplication rates:
  - Enrolment: 2.28%  
  - Demographic: 5.09%  
  - Biometric: 22.86%  
- Confirmed geographic coverage:
  - **38 States/UTs**
  - **910 Districts**
  - **19,463 Pincodes** 

---

## Key Insights

### Enrolment Analysis
- **Total Enrolments:** 5.33 million  
- Uttar Pradesh, Bihar, and Madhya Pradesh dominate overall enrolments  
- **Anomaly detected:** Meghalaya and Assam lead in **18+ enrolments**, indicating late enrolment behavior rather than birth-based enrolment  
- Border districts near Bangladesh show unusually high enrolment volumes  
- Bengaluru and Bengaluru Urban contribute disproportionately to adult enrolments 

### Biometric Updates
- **Total Updates:** 68.26 million  
- Maharashtra and Uttar Pradesh account for the highest update volumes  
- Urban and industrial districts (Pune, Thane, Nashik) dominate updates  
- Age group split is nearly balanced between 5–17 and 18+ 

### Demographic Updates
- **Total Updates:** 36.59 million  
- Updates heavily skewed toward **18+ population (~90%)**  
- Major IT and industrial hubs drive demographic changes  
- Strong correlation with workforce migration patterns 

---

## Regional Office Analysis
- States and districts were mapped to UIDAI Regional Offices  
- RO-wise distribution highlights operational load imbalance  
- Enables targeted resource planning and staffing optimization 

---

## Visualizations
The project includes:
- State-wise and district-wise bar charts  
- Age group distribution pie charts  
- Month-wise trend line graphs  
- Regional Office distribution plots  

All visualizations are reproducible from the notebooks provided in this repository and **mentioned in [report](REPORT.pdf)**

---

## Repository Structure
```text
UIDAI_Data_Hackathon_2026/
├── Analysis/
│   ├── 01_importing_data.sql
│   ├── 02_schema_validation.sql
│   ├── 03_geographical_analysis.sql
│   ├── 04_age_category_analysis.sql
│   └── 05_data_quality_checks.sql
├── README.md
└── Visualization/
    ├── biometric/
    │   ├── api_data_aadhar_biometric_0_500000.csv
    │   ├── api_data_aadhar_biometric_1000000_1500000.csv
    │   ├── api_data_aadhar_biometric_1500000_1861108.csv
    │   ├── api_data_aadhar_biometric_500000_1000000.csv
    │   └── biometric.ipynb
    ├── demographic/
    │   ├── api_data_aadhar_demographic_0_500000.csv
    │   ├── api_data_aadhar_demographic_1000000_1500000.csv
    │   ├── api_data_aadhar_demographic_1500000_2000000.csv
    │   ├── api_data_aadhar_demographic_2000000_2071700.csv
    │   ├── api_data_aadhar_demographic_500000_1000000.csv
    │   └── demographic.ipynb
    └── enrolment/
        ├── api_data_aadhar_enrolment_0_500000.csv
        ├── api_data_aadhar_enrolment_1000000_1006029.csv
        ├── api_data_aadhar_enrolment_500000_1000000.csv
        └── enrolment.ipynb
```
## Conclusion
This project demonstrates how UIDAI operational data can be systematically transformed into high-impact analytical insights.

The findings highlight:
- Regional anomalies
- Late enrolment trends
- Migration-driven updates
- Operational bottlenecks

These insights can directly inform policy decisions, targeted enrolment drives, and regional resource allocation.

---

## Acknowledgment
We thank UIDAI for providing the dataset and the opportunity to participate in the UIDAI Data Hackathon 2026.

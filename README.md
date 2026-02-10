# 🌍 World Life Expectancy Analysis (MySQL)
## 📌 Project Overview

This project focuses on cleaning and analyzing global life expectancy data using MySQL.
The dataset contains health, economic, and demographic indicators across countries and years, with several real-world data quality issues such as missing values, inconsistencies, and duplicates.

The goal of this project is to:

Prepare a reliable, analysis-ready dataset through structured SQL data cleaning.

Extract meaningful insights related to life expectancy, economic factors, and health indicators.

All logic is clearly documented using in-line SQL comments, making the project easy to follow and reproducible.

## 🧱 Dataset Description

The dataset includes country-level data across multiple years with the following key attributes:

**Demographics:** Country, Year, Status (Developed / Developing)

**Health Indicators:** Life Expectancy, Adult Mortality, Infant Deaths, HIV/AIDS, BMI

**Immunization:** Polio, Diphtheria

**Economic Factors:** GDP, Percentage Expenditure

**Education & Nutrition:** Schooling, Thinness (1–19 & 5–9 years)

Example records include countries such as Afghanistan, Albania, Algeria, Australia, Argentina, and many more, spanning multiple years.

# 🧹 Part 1: Data Cleaning (SQL)

The cleaning phase focuses on making the dataset accurate, consistent, and trustworthy for analysis.

 ## Key Cleaning Steps:

### checking for duplicates using count and concat functions, if found we need to delete them and update it to the database:

<img width="1433" height="751" alt="pro1_part1_pic1" src="https://github.com/user-attachments/assets/965c2660-8fa9-4799-858f-fe1fdcad69ed" />


### Using row_number() function to make sure all duplicate rows standout and we can **alter(delete)** them later and **update** it to the database 

<img width="1440" height="707" alt="pro1_part1_pic2" src="https://github.com/user-attachments/assets/ffc78879-4b3e-40dd-95a8-e1c6103370b1" />


### Standardizing data by checking any mispellings in columns and updating them

<img width="1204" height="662" alt="pro1_part1_pic3" src="https://github.com/user-attachments/assets/e733c202-fe86-466a-86ea-cb4ac7a2eb45" />


### Corrected inconsistent data by self joining the tables and populating data using average of before and after values

<img width="1204" height="662" alt="pro1_part1_pic4" src="https://github.com/user-attachments/assets/95054b3b-95fa-4a7a-adfa-e57433489ec4" />

 

Each step is documented with clear SQL comments explaining the intent and logic, following best practices used in real analytics workflows.

# 📊 Part 2: Data Analysis (SQL)

**Once the data was cleaned, analytical queries were written to explore patterns and trends.**

## Key Questions Explored

### how each country has done in past with their life expectancy? also filter out zeros if you find them?

<img width="1022" height="736" alt="pro1_part2_pic1" src="https://github.com/user-attachments/assets/5adfe79c-d40c-4d7b-8135-fd343ccceb17" />


### analyze which year has the best and worst life expectancy?

<img width="789" height="719" alt="pro1_part2_pic2" src="https://github.com/user-attachments/assets/a0e18bc3-6e0b-4d84-a65a-aa091db4ec3a" />


### how GDP effecting life expectancy / correlationship between GDP and life expectancy ?

<img width="936" height="709" alt="pro1_part2_pic3" src="https://github.com/user-attachments/assets/558831d3-92ee-4d0e-af7b-6e5e1c91b547" />


### how life expectancy changes when GDP is high and GDP is low?

<img width="867" height="528" alt="pro1_part2_pic4" src="https://github.com/user-attachments/assets/ce104b0c-ffc5-4282-b0f8-d10e409d7627" />


### life expectancy correlationship with developed or developing country

<img width="932" height="509" alt="pro1_part2_pic5" src="https://github.com/user-attachments/assets/33f5bef3-7664-4d83-bf30-c0b3cd6b4371" />


### how bmi effects life expectancy?

<img width="876" height="669" alt="pro1_part2_pic6" src="https://github.com/user-attachments/assets/45e3c25b-fb60-43d7-9640-c1521341840f" />


### adult mortality correlation with life expectancy using rolling_total

<img width="773" height="690" alt="pro1_part2_pic7" src="https://github.com/user-attachments/assets/27dc8409-fc37-4ffd-9c82-0c7d3cc097d1" />


## 🛠 Tools & Skills Used

**Database:** MySQL

**Core SQL Skills:** Data Cleaning & Validation

**Aggregations** (AVG, SUM, MIN, MAX)

**Filtering** (WHERE, HAVING)

**Joins & subqueries**

**Analytical reasoning with real-world data**

## 🎯 Key Takeaways

Data cleaning is critical before any meaningful analysis.

SQL alone is powerful enough to handle end-to-end analytics workflows.

Health and economic indicators show strong correlations with life expectancy.

Clear documentation makes analytical work easier to review and reuse.

## 🚀 Why This Project Matters

This project reflects real-world data analyst responsibilities, including:

Working with messy, imperfect datasets

Making data analysis-ready using SQL

Translating raw data into insights

Writing clean, readable, and well-commented queries

It serves as a foundational portfolio project demonstrating practical SQL proficiency.

## Author

## Varun Voleti – Data Analyst | SQL Enthusiast

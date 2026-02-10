# 🌍 World Life Expectancy Analysis (MySQL)
## 📌 Project Overview

This project focuses on cleaning and analyzing global life expectancy data using MySQL.
The dataset contains health, economic, and demographic indicators across countries and years, with several real-world data quality issues such as missing values, inconsistencies, and duplicates.

The goal of this project is twofold:

Prepare a reliable, analysis-ready dataset through structured SQL data cleaning.

Extract meaningful insights related to life expectancy, economic factors, and health indicators.

All logic is clearly documented using in-line SQL comments, making the project easy to follow and reproducible.

## 🧱 Dataset Description

The dataset includes country-level data across multiple years with the following key attributes:

Demographics: Country, Year, Status (Developed / Developing)

Health Indicators: Life Expectancy, Adult Mortality, Infant Deaths, HIV/AIDS, BMI

Immunization: Polio, Diphtheria

Economic Factors: GDP, Percentage Expenditure

Education & Nutrition: Schooling, Thinness (1–19 & 5–9 years)

Example records include countries such as Afghanistan, Albania, Algeria, Australia, Argentina, and many more, spanning multiple years.

# 🧹 Part 1: Data Cleaning (SQL)

The cleaning phase focuses on making the dataset accurate, consistent, and trustworthy for analysis.

Key Cleaning Steps

Identified and handled missing values (e.g., Life Expectancy gaps)
<img width="440" height="364" alt="08 01 2026_01 45 05_REC" src="C:\Users\vvsv2\Desktop\sql 2026\pro1_part1_pic1.png"/>


Standardized categorical fields such as Status

Removed or validated duplicate records

Corrected inconsistent numeric values

Ensured proper data types for analytical queries

Verified country–year continuity where applicable

Each step is documented with clear SQL comments explaining the intent and logic, following best practices used in real analytics workflows.

# 📊 Part 2: Data Analysis (SQL)

Once the data was cleaned, analytical queries were written to explore patterns and trends.

Key Questions Explored

How does life expectancy vary between developed and developing countries?

What is the relationship between GDP and life expectancy?

How do adult mortality and infant deaths impact life expectancy?

How has life expectancy changed over time for different countries?

Which countries show consistent improvement or decline?

Advanced SQL concepts were applied, including:

GROUP BY and aggregate functions

Conditional logic

Trend analysis over time

Country-level and global comparisons

## 🛠 Tools & Skills Used

Database: MySQL

Core SQL Skills:

Data Cleaning & Validation

Aggregations (AVG, SUM, MIN, MAX)

Filtering (WHERE, HAVING)

Joins & subqueries

Analytical reasoning with real-world data

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

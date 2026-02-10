# part 2: data analysis after data cleaning
-- here after getting clean data we will find insights & trends in the data that we can use in future

select *
from world_life_expectancy
;

# how each country has done in past with their life expectancy? also filter out zeros if you find them.
select country, min(`Life expectancy`), max(`Life expectancy`),
round(max(`Life expectancy`) - min(`Life expectancy`),1) as difference_in_life_expectance
from world_life_expectancy
group by Country
having min(`Life expectancy`) <> 0 and max(`Life expectancy`) <> 0
order by difference_in_life_expectance desc
;
# ans: After excluding invalid zero values, the data shows that all countries experienced improvements in life expectancy over time, with the largest gains occurring in historically low-income or crisis-affected nations, while developed countries saw smaller but steady increases.
# Life expectancy has increased in almost every country, but the magnitude of improvement varies a lot depending on development level, health crises, and historical instability.

# analyze which year has the best and worst life expectancy?
select year, round(avg(`life expectancy`),2) as avg_life_expectancy
from world_life_expectancy
where `Life expectancy` <> 0
group by year
order by year
;
# ans: Life Expectancy by Year (Global Average)
-- After excluding zero values, the data shows a steady and consistent improvement in global life expectancy over time.
#🟢 Best Year
-- 2022 has the highest average life expectancy
#Average: 71.62 years
#🔴 Worst Year
#2007 has the lowest average life expectancy
#Average: 66.75 years

# how GDP effecting life expectancy / correlationship between GDP and life expectancy ?
select Country, round(avg(`Life expectancy`),1) as life_Exp, round(avg(GDP),1) as GDP
from world_life_expectancy
group by country
having life_Exp > 0 and GDP > 0
order by GDP asc
;

# how life expectancy changes when GDP is high and GDP is low?
select 
	sum(Case
		when GDP >=1500 then 1 else 0
		end) high_gdp_count,
	round(avg(case 
			when GDP >= 1500 then `Life expectancy` else null
			end),2) high_gdp_life_expectancy,
	sum(case
		when GDP <= 1500 then 1 else 0
        end) low_gdp_count,
	round(avg(case
			when GDP <= 1500 then `Life expectancy` else null
            end),2) low_gdp_life_expectancy
from world_life_expectancy
;

# life expectancy correlationship with developed or developing country
select status, round(avg(`Life expectancy`),2)
from world_life_expectancy
group by status
;

# using distinct function we can see how many countries fall into each catogories like deoveleped and developing country
select status, count(distinct country), round(avg(`Life expectancy`),2)
from world_life_expectancy
group by status
;

# how bmi effects life expectancy?
select  Country, round(avg(`Life expectancy`), 2) as life_exp, round(avg(bmi),2) as BMI
from world_life_expectancy
group by country
having life_exp > 0 and BMI > 0
order by BMI desc
;

# adult mortality correlation with life expectancy using rolling_total
select Country, year, `Life expectancy`, `Adult Mortality`,
sum(`Adult Mortality`) over(partition by country order by year) as rolling_total
from world_life_expectancy
where country like '%united%'
;




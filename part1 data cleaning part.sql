# Part1 -- data cleaning project: World Life Expectancy Project 
# make sure you stage your data before cleaning it
# steps involved in data cleaning 
-- 1. removing duplicates
-- 2. standardizing data
-- 3. breaking 1 column into multiplecolumns (like address)
-- 4. working with null
-- 5. deleting columns (only if necessary)


select *
from world_life_expectancy
;

# step 1

#checking for duplicates using concat and count, 
-- we are using group by because we are using count which is aggrigate function. 
-- we also use having to check if count is greater than 1, which says that there are more than 1 entry of that row

select Country, Year, concat(country, ' ', year) ,count(concat(country, ' ', year))
from world_life_expectancy
group by Country, year, concat(country, ' ', year)
having count(concat(country, ' ', year)) > 1
;

# using row_number function to make those duplicate rows stand out and later alter(delete) them
-- using row_number() over(partition by, order by) to make duplicates pop out
-- filter the data using subquery from 'from', to filter data when using row_number, it is always better to use subquery
-- filtering starts from where

select *
from (
	select Row_ID, concat(country, ' - ', year),
	row_number() over(partition by concat(country, ' - ', year) order by concat(country, ' - ', year)) as row_num
	from world_life_expectancy) as row_table
where row_num > 1
;

# now after finding out duplicates, use 'DELETE' function to delete those rows
-- using delete from table name, where column name "in" keyword
-- after in keyword use subquery to delete the rows

set sql_safe_updates = 0; # I use this to tell mysql that I am updating my data

delete from world_life_expectancy
where
	Row_ID in 
    (select Row_ID
from (
	select Row_ID,
    concat(country, ' - ', year),
	row_number() over(partition by concat(country, ' - ', year) order by concat(country, ' - ', year)) as row_num
	from world_life_expectancy) as row_table
where row_num > 1)
;

select *
from world_life_expectancy
where status = ''
;

select distinct(status)
from world_life_expectancy
where Status <> ''
;

# step 2: standardizing data

# we are trying to populate data for status "developing" or "Developed" for blank cells
select distinct(country)
from world_life_expectancy
where Status = 'Developing'
;

# this process doesent work because we cannot use subquery in updating data
update world_life_expectancy 
set status = 'Developing'
where country in (select distinct (country)
					from world_life_expectancy
                    where Status = 'Developing')
; 

# so we can use inner join functions to make it work
update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.country = t2.country
set t1.status = 'Developing'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developing'
;

# let us do same thing for developing
update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.country = t2.country
set t1.status = 'Developed'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developed'
;

# we can repeat this operation to find nulls and populate them

select *
from world_life_expectancy
where `Life expectancy` = ''
;

select t1.country, t1.year, t1.`life expectancy`,
t2.country, t3.year, t2.`life expectancy`,
t3.country, t3.year, t3.`life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
from world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
    and t1.year = t2.year -1
join world_life_expectancy as t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year + 1
where t1.`Life expectancy` =  ''
;

update world_life_expectancy as t1
join world_life_expectancy as t2
	on t1.Country = t2.Country
    and t1.year = t2.year -1
join world_life_expectancy as t3
	on t1.Country = t3.Country
    and t1.Year = t3.Year + 1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
where t1.`Life expectancy` = ''
;

    

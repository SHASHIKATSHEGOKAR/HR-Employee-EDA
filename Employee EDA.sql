USE employee;

SELECT * FROM employee.employee;

/*show all the column names*/

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'employee'
  AND TABLE_NAME = 'employee';

/* 1 What is the average age of employees in the company? */

select avg(age) as avg_age from employee;

/* 2 What is the average training score of employees in each department */

select department, avg(avg_training_score) as avg_score
from employee
group by department;

/* 3 How many employees have won awards, and what percentage of the workforce does this represent?*/

select count(*) as num_award_winners,
	(count(*) / (select count(*) from employee)) * 100 as percentage
from employee
    where awards_won = 1;

/* 4 What is the distribution of employees education levels*/

select education, count(*) as no_of_employee
from employee
group by education;

/* 5 How many employees have a KPI score 
of more than 80, and what percentage is this of the total workforce?*/

select count(*)as no_of_High_KPIs,
	(count(*)/(select count(*) from employee)) * 100 as percentage
from employee
group by KPIS_met_more_than_80 = 1;

/* 6 *What is the average length of service for employees in each department? */

select department, avg(length_of_service) as avg_service
from employee
group by department;

/* 7 How many employees have completed a different number of training programs? 
List the counts for various numbers of training completed.*/

select no_of_trainings, count(*) as No_employee
from employee
group by no_of_trainings;

/* 8 What is the distribution of previous year ratings among employees? */

select previous_year_rating, count(*) as No_Employee
from employee
group by previous_year_rating;









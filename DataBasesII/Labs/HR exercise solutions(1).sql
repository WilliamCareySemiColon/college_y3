/*
1.	Create a view that will hold the full employee's first name, last name and full name (first_name,' ', last_name) as emp_name, their (current) job_id, manager_id,  department_id, city, and country_name.
*/
create or replace view easyemp as 
select employee_id, first_name, last_name, first_name||' '||last_name emp_name, 
job_id, e.manager_id, e.department_id, city, country_name
from employees e
join departments d on (e.department_id = d.department_id)
join locations using (location_id)
join countries using (country_id);
select * from easyemp;
/*
2.	Write a query to return every employee's name and number of previous jobs they held (there is a row in job_history for each previous job).
*/
select emp_name, count(h.job_id) from easyemp e left join job_history h using (employee_id)
group by emp_name;
/*3.	Write a query to return the employee name of any employee who has held more than one previous job.
*/
select emp_name
from easyemp e 
where employee_id in (
select employee_id from  job_history 
 group by employee_id having count(*)>1);
/*4.	Write a query to return the first names that appear in employees who
a.	are currently working in the US (country named 'United States of America').
*/
select first_name from easyemp where country_name = 'United States of America';
/*b.	 are currently working in the UK (country named 'United Kingdom').
*/
select first_name from easyemp where country_name = 'United Kingdom';

/*c.	Are working either in US or the UK (i.e. a Jane in US or in UK)
*/

select first_name from easyemp where country_name = 'United States of America'
union
select first_name from easyemp where country_name = 'United Kingdom';

/*d.	Are working in both (i.e. the name Jane appears in both groups)
*/
select first_name from easyemp where country_name = 'United States of America'
intersect
select first_name from easyemp where country_name = 'United Kingdom';
/*e.	Are working in US but not UK
*/


/*f.	Are working in UK but not US
*/
select first_name from easyemp where country_name = 'United Kingdom'
minus
select first_name from easyemp where country_name = 'United States of America';
/*g.	Are working either in UK or US, but not both.
*/
select first_name from easyemp where country_name = 'United States of America'
union
select first_name from easyemp where country_name = 'United Kingdom'
minus (select first_name from easyemp where country_name = 'United States of America'
intersect
select first_name from easyemp where country_name = 'United Kingdom'
);
/*6.	Return full details on all departments where there are no current employees.
*/
select * from departments d where not exists (select * from employees e where e.department_id = d.department_id);


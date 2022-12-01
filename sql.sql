/*
 Попробуйте вывести не просто самую высокую зарплату во 
 всей команде, а вывести именно фамилию сотрудника с самой высокой зарплатой.
*/

select
fio
,dept_id
,salary
from  de_sprint_schemas."Employers"
where  salary 
in(
select
max(salary) as sl
from de_sprint_schemas."Employers"
group by dept_id
)
/*
b. Попробуйте вывести фамилии сотрудников в алфавитном порядке
*/
select fio
from de_sprint_schemas."Employers"
order by fio 

/*c.     Рассчитайте средний стаж для каждого уровня сотрудников*/
select grade
,avg(stag) as "Средний стаж в днях"
from
(select * ,(now()::date - date_of_workon::date) as stag
from de_sprint_schemas."Employers"
) as wwww
group by grade

/*d.     Выведите фамилию сотрудника и название отдела, в котором он работает*/

select 
fio
,d.name 
from de_sprint_schemas."Employers"  e
join de_sprint_schemas."Departments"   d
  on e.dept_id = d.dept_id

/*e.     Выведите название отдела и фамилию сотрудника с самой высокой зарплатой в данном отделе и саму зарплату также.*/ 

select
d.name
,fio
,salary
from  de_sprint_schemas."Employers" e
join de_sprint_schemas."Departments" d
 on e.dept_id = d.dept_id

where  salary 
in(
select
max(salary) as sl
from de_sprint_schemas."Employers"
group by dept_id
) 

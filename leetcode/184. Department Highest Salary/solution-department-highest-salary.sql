# Write your MySQL query statement below
with department_max_salary as (
    select
        d.*,
        max(e.salary) as max_salary
    from
        Department d
    join
        Employee e on d.id = e.departmentId
    group by
        d.id
)
select
    d.name as "Department",
    e.name as "Employee",
    e.salary as "Salary"
from
    Employee e
join
    department_max_salary d on d.id = e.departmentId
where
    e.salary = d.max_salary and
    e.departmentId = d.id

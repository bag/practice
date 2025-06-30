# Write your MySQL query statement below
select
    d.name as "Department",
    e.name as "Employee",
    e.salary as "Salary"
from
    Employee e
join Department d on e.departmentId = d.id
where
    -- This is a "tuple comparison" or a 
    -- "multi-column in clause".
    (e.salary, e.departmentId) in (
        select
            max(salary) as "Salary",
            departmentId
        from
            Employee
        group by
            departmentId
    )

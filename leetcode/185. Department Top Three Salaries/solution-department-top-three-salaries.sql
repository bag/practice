# Write your MySQL query statement below
-- select
--     d.name as 'Department',
--     e.name as 'Employee',
--     e.salary as 'Salary'
-- from
--     Employee e
-- join
--     Department d on e.departmentId = d.id
-- where
--     e.salary in (
--         select
--             row_number() over() as rn,
--             dense_rank() over(salary)
--         from
--             Employee
--         where
--             rn <= 3
--     )
-- order by
--     d.name asc,
--     e.salary desc
with ranked as (
    select
        d.name as 'dname',
        e.name as 'ename',
        e.salary,
        dense_rank() over (partition by e.departmentId order by e.salary desc) as srank
    from
        Employee e
    join
        Department d on e.departmentId = d.id
    order by
        d.name asc,
        e.salary desc
)
select
    dname as 'Department',
    ename as 'Employee',
    salary as 'Salary'
from
    ranked
where srank <= 3
-- select
--     d.name,
--     e.name,
--     e.salary,
--     dense_rank() over (partition by e.departmentId order by e.salary desc) as 'rank'
-- from
--     Employee e
-- join
--     Department d on e.departmentId = d.id
-- order by
--     d.name asc,
--     e.salary desc

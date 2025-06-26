# Write your MySQL query statement below
with DistinctOrderedSalaries_cte as (
    select
        distinct salary,
        dense_rank() over(order by salary desc) as r
    from
        Employee
    order by
        salary desc
)
select
    ifnull(
        (select
            salary
        from 
            DistinctOrderedSalaries_cte
        where
            r = 2)
    , null) as SecondHighestSalary

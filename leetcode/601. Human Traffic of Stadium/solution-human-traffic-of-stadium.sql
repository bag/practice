# Write your MySQL query statement below
with qualified_people as (
    select
        id,
        visit_date,
        people,
        -- row numbers and ids will generate the same 
        -- group number when they are sequential.
        -- THis is a very useful math trick!
        id - row_number() over(order by id) as groupId
    from
        Stadium
    where
        people >= 100
)
select
    id,
    visit_date,
    people
from
    qualified_people
where
    groupId in (
        -- groups that have a run of 3 or more in sequence
        select 
            groupId
        from
            qualified_people
        group by
            groupId
        having
            count(*) >= 3        
    )
order by
    visit_date

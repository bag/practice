# Write your MySQL query statement below
with ranking as (
    select
        *,
        rank() over(partition by num order by id) as rank_val
    from Logs
)
select
    distinct num as ConsecutiveNums
from
    ranking
group by
    num,
    id - rank_val
having
    count(*) >= 3

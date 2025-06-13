# Write your MySQL query statement below
with non_banned as (
    select
        request_at,
        case
            when status = 'completed' then 1 else 0
        end as 'completed',
        case
            when status like 'cancelled%' then 1 else 0
        end as 'cancelled',
        u.banned as 'uban',
        d.banned as 'dban'
    from
        Trips t
    join
        Users u on t.client_id = u.users_id
    join
        Users d on t.driver_id = d.users_id
    where
        u.banned = 'No' and
        d.banned = 'No'
)
select
    request_at as 'Day',
    round(sum(cancelled)/(sum(cancelled) + sum(completed)), 2) as 'Cancellation Rate'
from
    non_banned
where
    request_at between '2013-10-01' and '2013-10-03'
group by
    Day
order by
    Day asc

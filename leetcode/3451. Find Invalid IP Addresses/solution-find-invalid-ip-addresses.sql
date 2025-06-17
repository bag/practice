# Write your MySQL query statement below
-- Step 1: Find the dot locations. We look for up to three.
with step_1_dot_loc_cte as (
    select 
        log_id,
        ip,
        status_code,
        length(ip) - length(replace(ip, '.', '')) as dot_count,
        -- These return 0 if no match.
        locate('.', ip) as first_dot,
        locate('.', ip, locate('.', ip) + 1) as second_dot,
        locate('.', ip, locate('.', ip, locate('.', ip) + 1) + 1) as third_dot
    from
        logs
),
-- Step 2: Split the text into nodes. Hooray for oldschool string functions!
step_2_node_str_cte as (
    select
        log_id,
        ip,
        status_code,
        dot_count,
        first_dot, second_dot, third_dot,
        case
            when dot_count = 0 then ip
            when dot_count >= 1 then substring(ip, 1, first_dot - 1)
        end as node_1_str,
        case
            when dot_count = 1 then substring(ip, first_dot + 1)
            when dot_count >= 2 then substring(ip, first_dot + 1, second_dot - first_dot  - 1)
        else
            null
        end as node_2_str,
        case
            when dot_count = 2 then substring(ip, second_dot + 1)
            when dot_count >= 3 then substring(ip, second_dot + 1, third_dot - second_dot - 1)
        else
            null
        end as node_3_str,
        case
            when dot_count = 3 then substring(ip, third_dot + 1)
        else
            null
        end as node_4_str
    from
        step_1_dot_loc_cte
),
-- Step 3: Convert the node strings to unsigned decimal!
step_3_node_dec_cte as (
    select
        *,
        convert(node_1_str, unsigned) as node_1_uint,
        convert(node_2_str, unsigned) as node_2_uint,
        convert(node_3_str, unsigned) as node_3_uint,
        convert(node_4_str, unsigned) as node_4_uint
    from
        step_2_node_str_cte
),
-- Step 4: Calculate the string lengths of the converted unsigned decimal nodes (and the original string nodes while we are here).
step_4_node_str_lens_cte as (
    select
        *,
        -- Note: although irregular, the length of a null string is converted to zero here for future comparison efficiency.
        coalesce(length(node_1_str), 0) as node_1_str_len,
        coalesce(length(node_2_str), 0) as node_2_str_len,
        coalesce(length(node_3_str), 0) as node_3_str_len,
        coalesce(length(node_4_str), 0) as node_4_str_len,
        coalesce(length(convert(node_1_uint, char)), 0) as node_1_uint_str_len,
        coalesce(length(convert(node_2_uint, char)), 0) as node_2_uint_str_len,
        coalesce(length(convert(node_3_uint, char)), 0) as node_3_uint_str_len,
        coalesce(length(convert(node_4_uint, char)), 0) as node_4_uint_str_len
    from
        step_3_node_dec_cte
)
-- Note: Below is a diagnostic query. Uncomment to use.
-- select * from step_4_node_str_lens_cte
select
    ip,
    count(*) as invalid_count
from 
    step_4_node_str_lens_cte
where
    ip not in (
        select
            ip
        from
            step_4_node_str_lens_cte
        where
            -- Filter 1: There should be three dots and four nodes.
            dot_count = 3 and
            -- Filter 2: valid range for an IP address? 0 <= 255.
            -- Note: unsigned ints have a minimum value of 0; no lower bounds check needed.
            node_1_uint <= 255 and
            node_2_uint <= 255 and
            node_3_uint <= 255 and
            node_4_uint <= 255 and
            -- Filter 3: if node string length (original) should be the same as string-converted unsigned length.
            node_1_str_len = node_1_uint_str_len and
            node_2_str_len = node_2_uint_str_len and
            node_3_str_len = node_3_uint_str_len and
            node_4_str_len = node_4_uint_str_len
    )
group by
    ip
order by
    invalid_count desc,
    ip desc
# Write your MySQL query statement below
/*
-- Step 1: Find the dot locations. We look for up to three.
with step_1_dot_loc_cte as (
    select 
        log_id,
        ip,
        status_code,
        length(ip) - length(replace(ip, '.', '')) as dot_count,
        -- These return 0 if no match.
        locate('.', ip) as first_dot,
        locate('.', ip, locate('.', ip) + 1) as second_dot,
        locate('.', ip, locate('.', ip, locate('.', ip) + 1) + 1) as third_dot
    from
        logs
),
-- Step 2: Split the text into nodes. Hooray for oldschool string functions!
step_2_node_str_cte as (
    select
        log_id,
        ip,
        status_code,
        dot_count,
        first_dot, second_dot, third_dot,
        case
            when dot_count = 0 then ip
            when dot_count >= 1 then substring(ip, 1, first_dot - 1)
        end as node_1_str,
        case
            when dot_count = 1 then substring(ip, first_dot + 1)
            when dot_count >= 2 then substring(ip, first_dot + 1, second_dot - first_dot  - 1)
        else
            null
        end as node_2_str,
        case
            when dot_count = 2 then substring(ip, second_dot + 1)
            when dot_count >= 3 then substring(ip, second_dot + 1, third_dot - second_dot - 1)
        else
            null
        end as node_3_str,
        case
            when dot_count = 3 then substring(ip, third_dot + 1)
        else
            null
        end as node_4_str
    from
        step_1_dot_loc_cte
),
-- Step 3: Convert the node strings to unsigned decimal!
step_3_node_dec_cte as (
    select
        *,
        convert(node_1_str, unsigned) as node_1_uint,
        convert(node_2_str, unsigned) as node_2_uint,
        convert(node_3_str, unsigned) as node_3_uint,
        convert(node_4_str, unsigned) as node_4_uint
    from
        step_2_node_str_cte
),
-- Step 4: Calculate the string lengths of the converted unsigned decimal nodes (and the original string nodes while we are here).
step_4_node_str_lens_cte as (
    select
        *,
        -- Note: although irregular, the length of a null string is converted to zero here for future comparison efficiency.
        coalesce(length(node_1_str), 0) as node_1_str_len,
        coalesce(length(node_2_str), 0) as node_2_str_len,
        coalesce(length(node_3_str), 0) as node_3_str_len,
        coalesce(length(node_4_str), 0) as node_4_str_len,
        coalesce(length(convert(node_1_uint, char)), 0) as node_1_uint_str_len,
        coalesce(length(convert(node_2_uint, char)), 0) as node_2_uint_str_len,
        coalesce(length(convert(node_3_uint, char)), 0) as node_3_uint_str_len,
        coalesce(length(convert(node_4_uint, char)), 0) as node_4_uint_str_len
    from
        step_3_node_dec_cte
)
-- Note: Below is a diagnostic query. Uncomment to use.
-- select * from step_4_node_str_lens_cte
select
    ip,
    count(*) as invalid_count
from 
    step_4_node_str_lens_cte
where
    ip not in (
        select
            ip
        from
            step_4_node_str_lens_cte
        where
            -- Filter 1: There should be three dots and four nodes.
            dot_count = 3 and
            -- Filter 2: valid range for an IP address? 0 <= 255.
            -- Note: unsigned ints have a minimum value of 0; no lower bounds check needed.
            node_1_uint <= 255 and
            node_2_uint <= 255 and
            node_3_uint <= 255 and
            node_4_uint <= 255 and
            -- Filter 3: if node string length (original) should be the same as string-converted unsigned length.
            node_1_str_len = node_1_uint_str_len and
            node_2_str_len = node_2_uint_str_len and
            node_3_str_len = node_3_uint_str_len and
            node_4_str_len = node_4_uint_str_len
    )
group by
    ip
order by
    invalid_count desc,
    ip desc
*/

-- More compact method:
select
    ip,
    count(*) as invalid_count
from
    logs
where
    ip not in (
        select
            ip
        from (
            select
                *,
                -- Note: See manual for use of substring_index.
                -- The original string is chopped into chunks
                -- delimited by the character provided.
                -- Which chunk is identified by the index.
                -- In an IP address, there will be four chunks.
                -- The call to index -1 means the one starting
                -- from the right edge, not the usual left edge.
                substring_index(ip, '.', 1) as node_1_str,
                substring_index(substring_index(ip, '.', 2), '.', -1) as node_2_str,
                substring_index(substring_index(ip, '.', 3), '.', -1) as node_3_str,
                substring_index(substring_index(ip, '.', 4), '.', -1) as node_4_str
            from
                logs
            where
                -- Note: Only three dots allowed.
                length(ip) - length(replace(ip, '.', '')) = 3
        ) as valid_ips_stage_1
        where
            -- Note: MySQL auto-casts chars to ints in where clauses for oyur convenience. Thanks, MySQL!
            node_1_str <= 255 and
            node_2_str <= 255 and
            node_3_str <= 255 and
            node_4_str <= 255 and
            -- Note: This section filters non-normal nodes in the tuple -- leading zeroes are not allowed.
            node_1_str not like '0%' and
            node_2_str not like '0%' and
            node_3_str not like '0%' and
            node_4_str not like '0%'
    )
group by
    ip
order by
    invalid_count desc,
    ip desc

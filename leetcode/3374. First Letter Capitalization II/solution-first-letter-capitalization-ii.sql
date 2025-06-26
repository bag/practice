# Write your MySQL query statement below
-- Oooo.... recursion!
-- This breaks the contents of content_text from the original user_content table
-- into words through the magic of regex.
with recursive words as (
    select
        content_id,
        content_text,
        regexp_substr(content_text, '[a-zA-Z]+|-', 1, 1) as word,
        1 as word_position
    from
        user_content
    where
        regexp_substr(content_text, '[a-zA-Z]+|-', 1, 1) is not null
    union all
    select
        content_id,
        content_text,
        regexp_substr(content_text, '[a-zA-Z]+|-', 1, word_position + 1),
        word_position + 1
    from
        words
    where
        regexp_substr(content_text, '[a-zA-Z]+|-', 1, word_position + 1) is not null
),
convertedtext as (
    select
        content_id,
        content_text,
        group_concat(upper(left(word, 1)), lower(substring(word, 2)) order by word_position separator ' ') as converted_text
    from
        words
    group by
        content_id,
        content_text
)
select
    content_id,
    content_text as original_text,
    replace(converted_text, ' - ', '-') as converted_text
from
    convertedtext

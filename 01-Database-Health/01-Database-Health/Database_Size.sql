/* project: sql server support toolkit
script: database_size.sql
purpose: check database data and log file sizes */

select
    db_name(database_id) as databasename,

    cast(
        sum(case
            when type_desc = 'rows' then size
            else 0
        end) * 8.0 / 1024
        as decimal(18,2)
    ) as datasizemb,

    cast(
        sum(case
            when type_desc = 'log' then size
            else 0
        end) * 8.0 / 1024
        as decimal(18,2)
    ) as logsizemb,

    cast(sum(size) * 8.0 / 1024 as decimal(18,2))
        as totalsizemb

from sys.master_files
group by database_id
order by totalsizemb desc;

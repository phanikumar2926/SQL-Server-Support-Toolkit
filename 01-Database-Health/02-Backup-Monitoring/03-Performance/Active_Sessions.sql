/*
project: sql server support toolkit
script: active_sessions.sql
purpose: monitor currently running sql server requests
*/

select
    r.session_id as sessionid,
    s.login_name as loginname,
    db_name(r.database_id) as databasename,
    r.status as requeststatus,
    r.command as commandtype,

    r.start_time as querystarttime,

    r.total_elapsed_time / 1000.0
        as elapsedtimeseconds,

    r.cpu_time as cputimemilliseconds,

    r.logical_reads as logicalreads,

    r.blocking_session_id as blockingsessionid,

    substring(
        t.text,
        (r.statement_start_offset / 2) + 1,
        (
            (
                case r.statement_end_offset
                    when -1 then datalength(t.text)
                    else r.statement_end_offset
                end
                - r.statement_start_offset
            ) / 2
        ) + 1
    ) as runningsql

from sys.dm_exec_requests r

inner join sys.dm_exec_sessions s
    on r.session_id = s.session_id

cross apply sys.dm_exec_sql_text(r.sql_handle) t

where r.session_id <> @@spid

order by r.total_elapsed_time desc;

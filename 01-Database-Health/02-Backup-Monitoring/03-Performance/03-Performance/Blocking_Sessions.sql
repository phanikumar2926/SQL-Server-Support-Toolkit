
/*
project: sql server support toolkit
script: blocking_sessions.sql
purpose: identify sql server blocking sessions
*/

select
    r.session_id as blockedsessionid,

    r.blocking_session_id as blockingsessionid,

    s.login_name as blockedlogin,

    s.host_name as computername,

    db_name(r.database_id) as databasename,

    r.status as requeststatus,

    r.wait_type as waittype,

    r.wait_time / 1000.0 as waittimeseconds,

    r.wait_resource as waitresource,

    t.text as runningsql

from sys.dm_exec_requests r

inner join sys.dm_exec_sessions s
    on r.session_id = s.session_id

cross apply sys.dm_exec_sql_text(r.sql_handle) t

where r.blocking_session_id <> 0

order by r.wait_time desc;

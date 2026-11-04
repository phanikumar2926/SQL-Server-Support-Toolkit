
/*
project: sql server support toolkit
script: table_records.sql
purpose: retrieve and count records from a table
*/

-- 1. list all user tables in the current database

select
    table_schema as schemaname,
    table_name as tablename
from information_schema.tables
where table_type = 'base table'
order by table_schema, table_name;


-- 2. count records in a specific table
-- replace dbo.yourtablename with your actual table

select count(*) as totalrecords
from dbo.yourtablename;


-- 3. retrieve sample records
-- replace dbo.yourtablename with your actual table

select top (10) *
from dbo.yourtablename;

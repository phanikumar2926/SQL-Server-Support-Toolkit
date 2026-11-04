/* project: sql server support toolkit
script: database_status.sql
purpose: check the status of sql server databases */


select
    name as databasename,
    state_desc as databasestatus,
    recovery_model_desc as recoverymodel,
    create_date as createddate
from sys.databases
order by name;

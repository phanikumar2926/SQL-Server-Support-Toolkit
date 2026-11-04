Project: SQL Server Support Toolkit
Script: Database_Status.sql
Purpose: Check the status of SQL Server databases


select
    name AS DatabaseName,
    state_desc AS DatabaseStatus,
    recovery_model_desc AS RecoveryModel,
    create_date AS CreatedDate
from sys.databases
order by name;

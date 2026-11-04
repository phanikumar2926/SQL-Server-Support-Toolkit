# SQL Server Support Toolkit

A collection of practical SQL Server scripts for database monitoring, backup verification, performance investigation, and troubleshooting.

# About This Project

The SQL Server Support Toolkit is designed for IT and Application Support Engineers who want to perform common SQL Server support activities using T-SQL and SQL Server Management Studio (SSMS).

# Project Objectives

- Check database status and health.
- Monitor database size and storage.
- Review SQL Server backup history.
- Identify active sessions and blocking processes.
- Retrieve table records for investigation.
- Verify SQL Server connection details.

# Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)

# Requirements

Before running these scripts, you need:

1. Microsoft SQL Server.
2. SQL Server Management Studio (SSMS).
3. Access to a SQL Server instance.
4. A test database for practising.

Some scripts require additional permissions to access SQL Server system views or the `msdb` database.

# Project Modules and Scripts

| Script | Purpose |
|---|---|
| Database_Status.sql | Checks database status and recovery model. |
| Database_Size.sql | Checks database data and log file sizes. |
| Backup_History.sql | Reviews database backup history. |
| Active_Sessions.sql | Displays connected user sessions. |
| Blocking_Sessions.sql | Identifies blocked and blocking sessions. |
| Table_Records.sql | Lists tables and checks table records. |
| Database_Connectivity.sql | Displays current SQL connection details. |

# How to Run the Scripts

1. Open SQL Server Management Studio (SSMS).
2. Connect to your SQL Server instance.
3. Open the required `.sql` file.
4. Select the appropriate database if required.
5. Review the query before executing it.
6. Press **F5** or click **Execute**.
7. Review the results in the Results tab.

# Sample Queries and Expected Results

# 1. Database Status

**Script:** Database_Status.sql

Checks the status of databases.

Example output:

| DatabaseName | DatabaseStatus |
|---|---|
| SampleDB | ONLINE |
| TestDB | ONLINE |

# 2. Database Size

**Script:** Database_Size.sql

Displays database data and log file sizes.

Example output:

| DatabaseName | DataSizeMB | LogSizeMB |
|---|---:|---:|
| SampleDB | 120.50 | 25.00 |

# 3. Backup History

**Script:** Backup_History.sql

Displays backup type, start time, finish time, and backup location.

Example output:

| DatabaseName | BackupType | BackupFinishDate |
|---|---|---|
| SampleDB | D | 2026-11-04 |

### 4. Active Sessions

**Script:** Active_Sessions.sql

Displays SQL Server user sessions, login names, computer names, and session status.

Example output:

| SessionID | LoginName | Status |
|---:|---|---|
| 55 | TestUser | sleeping |
| 58 | TestUser | running |

# 5. Blocking Sessions

**Script:** Blocking_Sessions.sql

Identifies sessions waiting for another session to release a resource.

**Expected result:** If no blocking is found, the query may return no rows.

# 6. Table Records

**Script:** Table_Records.sql

Lists tables and demonstrates how to count and retrieve records.

Example output:

| TotalRecords |
|---:|
| 10 |

# 7. Database Connectivity

*Script:** Database_Connectivity.sql

Displays the connected SQL Server instance, current database, login name, and connection date/time.

Example output:

| ServerName | DatabaseName | LoginName |
|---|---|---|
| SQLSERVER01 | SampleDB | TestUser |

*Note: All sample outputs above are illustrative. Actual results depend on your SQL Server instance and database.*

# Testing Instructions

All scripts in this project have been executed and tested in a local SQL Server environment.

To test them yourself:

1. Connect to your local or test SQL Server instance.
2. Open each SQL script in SSMS.
3. Execute the query.
4. Review the output.
5. Compare your results with the examples above.

# Important Safety Notes

- Practise in a local or approved test environment.
- Verify the server and database before executing queries.
- Do not run scripts against production databases without authorization.
- Never publish passwords, customer information, or confidential company details.
- Be careful with UPDATE, DELETE, DROP, and RESTORE commands.

# Learning Purpose

This project is part of my learning journey in SQL Server administration and application support.

My goal is to develop practical skills in database monitoring, backup verification, performance investigation, and troubleshooting.

# Author

**Phani Kumar**

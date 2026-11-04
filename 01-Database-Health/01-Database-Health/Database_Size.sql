Project: SQL Server Support Toolkit
Script: Database_Size.sql
Purpose: Check database data and log file sizes

SELECT
    DB_NAME(database_id) AS DatabaseName,

    CAST(
        SUM(CASE
            WHEN type_desc = 'ROWS' THEN size
            ELSE 0
        END) * 8.0 / 1024
        AS DECIMAL(18,2)
    ) AS DataSizeMB,

    CAST(
        SUM(CASE
            WHEN type_desc = 'LOG' THEN size
            ELSE 0
        END) * 8.0 / 1024
        AS DECIMAL(18,2)
    ) AS LogSizeMB,

    CAST(SUM(size) * 8.0 / 1024 AS DECIMAL(18,2))
        AS TotalSizeMB

FROM sys.master_files
GROUP BY database_id
ORDER BY TotalSizeMB DESC;

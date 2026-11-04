-- Check SQL Server connection details

SELECT
    @@SERVERNAME AS ServerName,
    DB_NAME() AS DatabaseName,
    SUSER_SNAME() AS LoginName,
    GETDATE() AS ConnectionDateTime,
    'Connected Successfully' AS ConnectionStatus;

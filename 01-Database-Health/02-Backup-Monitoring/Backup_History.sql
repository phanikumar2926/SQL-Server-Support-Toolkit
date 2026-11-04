/*
project: sql server support toolkit
script: backup_history.sql
purpose: review sql server database backup history
*/

select
    bs.database_name as databasename,

    case bs.type
        when 'd' then 'full backup'
        when 'i' then 'differential backup'
        when 'l' then 'transaction log backup'
        else 'other'
    end as backuptype,

    bs.backup_start_date as backupstarttime,
    bs.backup_finish_date as backupfinishtime,

    cast(
        bs.backup_size / 1024.0 / 1024
        as decimal(18,2)
    ) as backupsizemb,

    bmf.physical_device_name as backuplocation

from msdb.dbo.backupset bs

left join msdb.dbo.backupmediafamily bmf
    on bs.media_set_id = bmf.media_set_id

order by bs.backup_finish_date desc;

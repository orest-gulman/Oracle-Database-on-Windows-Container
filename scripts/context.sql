SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\context.log append
@C:\oracle\product\19.0.0\dbhome_1\ctx\admin\catctx.sql Xbkfsdcdf1ggh_123 SYSAUX TEMP LOCK;
alter user CTXSYS account unlock identified by "CTXSYS";
connect "CTXSYS"/"CTXSYS"
@C:\oracle\product\19.0.0\dbhome_1\ctx\admin\defaults\dr0defin.sql "AMERICAN";
connect "SYS"/"&1" as SYSDBA
alter user CTXSYS password expire account lock;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\dbmsxdbt.sql;
spool off

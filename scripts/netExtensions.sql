SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\netExtensions.log append
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\dbmsclr.plb;
spool off
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\postDBCreation.log append

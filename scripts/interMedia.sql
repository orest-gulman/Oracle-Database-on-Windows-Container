SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\interMedia.log append
@C:\oracle\product\19.0.0\dbhome_1\ord\im\admin\iminst.sql;
spool off

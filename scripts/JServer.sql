SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\JServer.log append
@C:\oracle\product\19.0.0\dbhome_1\javavm\install\initjvm.sql;
@C:\oracle\product\19.0.0\dbhome_1\xdk\admin\initxml.sql;
@C:\oracle\product\19.0.0\dbhome_1\xdk\admin\xmlja.sql;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\catjava.sql;
connect "SYS"/"&1" as SYSDBA
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\catxdbj.sql;
spool off

SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\CreateDBCatalog.log append
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\catalog.sql;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\catproc.sql;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\catoctk.sql;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\owminst.plb;
connect "SYS"/"&1" as SYSDBA
alter session set current_schema=SYSTEM;
@C:\oracle\product\19.0.0\dbhome_1\sqlplus\admin\pupbld.sql;
connect "SYS"/"&1" as SYSDBA
@C:\oracle\product\19.0.0\dbhome_1\sqlplus\admin\pupdel.sql;
connect "SYS"/"&1" as SYSDBA
alter session set current_schema=SYSTEM;
set echo on
spool Scripts\Logs\sqlPlusHelp.log append
@C:\oracle\product\19.0.0\dbhome_1\sqlplus\admin\help\hlpbld.sql helpus.sql;
spool off
spool off

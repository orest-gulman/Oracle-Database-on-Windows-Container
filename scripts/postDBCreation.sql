SET VERIFY OFF
spool Scripts\Logs\postDBCreation.log append
host C:\oracle\product\19.0.0\dbhome_1\OPatch\datapatch.bat -skip_upgrade_check -db ORA193;
connect "SYS"/"&1" as SYSDBA
set echo on
create spfile='C:\oracle\product\19.0.0\dbhome_1\database\spfileORA193.ora' FROM pfile='C:\oracle\product\19.0.0\dbhome_1\database\init.ora';
connect "SYS"/"&1" as SYSDBA
select 'utlrp_begin: ' || to_char(sysdate, 'HH:MI:SS') from dual;
@C:\oracle\product\19.0.0\dbhome_1\rdbms\admin\utlrp.sql;
select 'utlrp_end: ' || to_char(sysdate, 'HH:MI:SS') from dual;
select comp_id, status from dba_registry;
shutdown immediate;
connect "SYS"/"&1" as SYSDBA
startup ;
spool off
exit;

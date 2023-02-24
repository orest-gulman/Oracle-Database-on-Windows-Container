SET VERIFY OFF
connect "SYS"/"&1" as SYSDBA
set echo on
spool Scripts\Logs\CreateDBFiles.log append
CREATE SMALLFILE TABLESPACE "INDEXES" DATAFILE  'C:\oracle\oradata\ORA193\indexes01.dbf' SIZE 10M AUTOEXTEND ON NEXT  10M MAXSIZE UNLIMITED;
CREATE SMALLFILE TABLESPACE "LOBDATA" DATAFILE  'C:\oracle\oradata\ORA193\lobdata01.dbf' SIZE 10M AUTOEXTEND ON NEXT  10M MAXSIZE UNLIMITED;
CREATE SMALLFILE TABLESPACE "USERS" LOGGING  DATAFILE  'C:\oracle\oradata\ORA193\users01.dbf' SIZE 10M REUSE AUTOEXTEND ON NEXT  10M MAXSIZE UNLIMITED;
ALTER DATABASE DEFAULT TABLESPACE "USERS";
spool off
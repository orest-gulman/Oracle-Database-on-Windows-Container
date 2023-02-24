set verify off
host C:\oracle\product\19.0.0\dbhome_1\bin\orapwd.exe file=C:\oracle\product\19.0.0\dbhome_1\database\PWDORA193.ora password=&1 force=y format=12
@c:\scripts\CreateDB.sql &1
@c:\scripts\CreateDBFiles.sql &1
@c:\scripts\CreateDBCatalog.sql &1
@c:\scripts\JServer.sql &1
@c:\scripts\context.sql &1
-- @c:\scripts\ordinst.sql &1
-- @c:\scripts\interMedia.sql &1
-- @c:\scripts\netExtensions.sql &1
@c:\scripts\lockAccount.sql &1
@c:\scripts\postDBCreation.sql &1
@c:\scripts\Post-install.sql &1

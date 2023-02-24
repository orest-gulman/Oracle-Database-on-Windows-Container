FROM mcr.microsoft.com/windows/servercore:ltsc2022
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'Continue'; $verbosePreference='Continue';"]
COPY /vcredist_x64.exe c:/vcredist_x64.exe
#Install VS2013 runtime env
RUN Start-Process -filepath C:/vcredist_x64.exe -ArgumentList "/install", "/passive", "/norestart" -PassThru | wait-process
COPY /WINDOWS.X64_193000_db_home c:/oracle/product/19.0.0/dbhome_1
COPY /scripts C:/scripts
COPY db.rsp c:/scripts/Install.rsp
#Execute scripts to create db
RUN c:/scripts/Install.bat
CMD C:\scripts\db\entrypoint.ps1; powershell

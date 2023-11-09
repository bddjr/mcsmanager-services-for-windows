title %~nx0
cd /d %~dp0
Net session >nul 2>&1 || powershell start-process "%~nx0" -verb runas && exit

sc start mcsmanagerweb.exe
sc start mcsmanagerdaemon.exe

pause

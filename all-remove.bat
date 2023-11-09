cd /d %~dp0
Net session >nul 2>&1 || powershell start-process "%~nx0" -verb runas && exit

sc stop mcsmanagerweb.exe
sc delete mcsmanagerweb.exe

sc stop mcsmanagerdaemon.exe
sc delete mcsmanagerdaemon.exe

timeout /t 5 /nobreak
rd /S /Q ..\web\daemon
rd /S /Q ..\daemon\daemon

echo Finish.
pause

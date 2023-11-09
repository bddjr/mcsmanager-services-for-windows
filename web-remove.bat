title %~nx0
cd /d %~dp0
Net session >nul 2>&1 || powershell start-process "%~nx0" -verb runas && exit

sc stop mcsmanagerweb.exe
sc delete mcsmanagerweb.exe

timeout /t 5 /nobreak
rd /S /Q ..\web\daemon

echo Finish.
pause

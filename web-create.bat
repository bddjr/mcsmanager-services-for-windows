cd /d %~dp0
Net session >nul 2>&1 || powershell start-process "%~nx0" -verb runas && exit

rd /S /Q daemon
rd /S /Q ..\web\daemon
rd /S /Q ..\daemon\daemon

cd worker
..\..\daemon\node_app.exe creater.js web
pause

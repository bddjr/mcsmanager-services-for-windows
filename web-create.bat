title %~nx0
cd /d %~dp0
Net session >nul 2>&1 || powershell start-process "%~nx0" -verb runas && exit

rd /S /Q ..\web\daemon

cd worker
..\..\daemon\node_app.exe creater.js web
pause

@echo off
title %~nx0
cd /d %~dp0
Net session >nul 2>&1 || (
    powershell start-process "%~nx0" -verb runas
    exit
)
@echo on

rd /S /Q ..\web\daemon
rd /S /Q ..\daemon\daemon

cd worker
@echo off
echo Starting creater.js
if exist ..\..\daemon\node_app.exe (
    ..\..\daemon\node_app.exe creater.js all
) else if exist ..\..\web\node_app.exe (
    ..\..\web\node_app.exe creater.js all
) else (
    echo Error: Can not find node_app.exe from daemon or web
)
pause

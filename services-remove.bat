@echo off
title %~nx0
cd /d %~dp0
echo MCSManager Services for Windows
echo https://github.com/bddjr/mcsmanager-services-for-windows
Net session >nul 2>&1 || (
    echo;
    echo Trying to run as Administrator
    powershell start-process "%~nx0" -verb runas
    exit
)
@echo on

set need_wait=false
sc stop mcsmanagerweb.exe
if %errorlevel%==0 set need_wait=true
sc delete mcsmanagerweb.exe

sc stop mcsmanagerdaemon.exe
if %errorlevel%==0 set need_wait=true
sc delete mcsmanagerdaemon.exe

if %need_wait%==true timeout /t 3 /nobreak
rd /S /Q ..\web\daemon
rd /S /Q ..\daemon\daemon

if "%1" neq "nopause" pause

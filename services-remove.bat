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
sc stop MCSManager-web
if %errorlevel%==0 set need_wait=true
sc delete MCSManager-web

sc stop MCSManager-daemon
if %errorlevel%==0 set need_wait=true
sc delete MCSManager-daemon

if %need_wait%==true timeout /t 3 /nobreak
rd /S /Q ..\web\winsw
rd /S /Q ..\daemon\winsw

if "%1" neq "nopause" pause

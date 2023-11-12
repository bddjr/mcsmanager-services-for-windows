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

sc start MCSManager-daemon
sc start MCSManager-web

if "%1" neq "nopause" pause

@echo off
title %~nx0
cd /d %~dp0
Net session >nul 2>&1 || (
    powershell start-process "%~nx0" -verb runas
    exit
)
@echo on

sc stop mcsmanagerweb.exe

pause

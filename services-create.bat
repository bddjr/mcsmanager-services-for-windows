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

call:create_svc web
call:create_svc daemon

if "%1" neq "nopause" pause

exit
:create_svc
@echo off
set winsw_name=WinSW.NET461
set workpath=..\%~1\winsw
mkdir %workpath%
set exepath=%workpath%\%winsw_name%.exe
copy /Y require\%winsw_name%.exe %exepath%
set xmlpath=%workpath%\%winsw_name%.xml
echo ^<service^>>%xmlpath%
echo ^<id^>MCSManager-%~1^</id^>>>%xmlpath%
echo ^<name^>MCSManager-%~1^</name^>>>%xmlpath%
echo ^<description^>MCSManager-%~1^</description^>>>%xmlpath%
echo ^<executable^>%%BASE%%\..\node_app.exe^</executable^>>>%xmlpath%
echo ^<arguments^>app.js^</arguments^>>>%xmlpath%
echo ^<workingdirectory^>%%BASE%%\..\^</workingdirectory^>>>%xmlpath%
echo ^<log mode="none" /^>>>%xmlpath%
echo ^</service^>>>%xmlpath%
%exepath% install
@echo on
goto:eof

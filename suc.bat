@echo off
:: SunlightCommander
:: This is a simple file-explorer for cmd / powershell
:: (C) Luca Franziskowski @ CodingOwl0 2018 V0.1

set var=%cd%
if "%1"=="-help" goto help
if "%1"=="-h" goto help
if "%1"=="-info" goto info
title Sunlight-Commander 
:start
echo %cd% |clip
cls
echo Sunlight-Commander        [%date%, %time%]                    V 0.1
echo ----------------------------------------------------------------------------
dir
echo ----------------------------------------------------------------------------
echo  ______   ______   ________   _____   ______   ______   ______   _________
echo [1 Back] [2 Goto] [3 Rename] [4 Run] [5 Exit] [6 Find] [7 File] [8 Forward]
choice/c 123456789 >nul
if %errorlevel%==8 goto forward
if %errorlevel%==7 goto file
if %errorlevel%==6 goto find
if %errorlevel%==5 goto ende
if %errorlevel%==4 goto run
if %errorlevel%==3 goto rename
if %errorlevel%==2 goto changedir
if %errorlevel%==1 echo %cd% >>%temp%\VoM.txt
if %errorlevel%==1 cd ..
if %errorlevel%==1 goto start
goto start

:file
echo  _____   ________   ________   ________
echo [1 New] [2 Delete] [3 Rename] [4 Return]
choice/c 1234 >nul
if %errorlevel%==4 goto start
if %errorlevel%==3 goto rename
if %errorlevel%==2 goto delete
if %errorlevel%==1 goto new

:delete
echo  _____________   ____________   ________
echo [1 Delete File] [2 Delete All] [3 Return]
choice/c 123 >nul
if %errorlevel%==3 set/p file=Filename: 
if %errorlevel%==3 if exist %file% del %file% \s \q
if %errorlevel%==3 if exist %file%.txt del %file%.txt \s \q
if %errorlevel%==3 goto start
if %errorlevel%==2 del *.* \s \q
if %errorlevel%==2 goto start
if %errorlevel%==1 goto newfolder


:new
echo  ____________   __________   ___________   ________
echo [1 New Folder] [2 New File] [3 Save tree] [4 Return]
choice/c 1234 >nul
if %errorlevel%==4 goto start
if %errorlevel%==3 dir > C:\Users\%username%\documents\tree%date%.txt
if %errorlevel%==3 goto start
if %errorlevel%==2 goto newfile 
if %errorlevel%==1 goto newfolder
goto new

:newfile
set/p name=Filename: 
set/p input=Data: 
echo %input% >>%name%
goto start

:newfolder
set folder=New_Folder
set/p folder=Foldername: 
mkdir %folder%
goto start

:forward
if not exist %temp%\VoM.txt echo No history found.
if exist %temp%\VoM.txt set/p historypath=<%temp%\VoM.txt
if exist %temp%\VoM.txt cd/d %historypath%
goto start

:find
echo  ______________   _____________
echo [1 Find in File] [2 Find a File]
choice/c 12 >nul
if %errorlevel%==2 goto findin
if %errorlevel%==1 goto findfi

:findfi
set/p in=Filename:
if exist %in% echo File found!
if not exist %in% echo File NOT found!
timeout/t 2 >nul
goto start

:findin
set/p in=Filename: 
set/p tofind=Find: 
if not exist "%in%" echo File not found.
if not exist "%in%" goto pause
find /I /N "%tofind%" %in%
:pause
echo.
echo Press a key to exit.
pause >nul
goto start

:run
if not exist *.bat if not exist *.exe if not exist *.cmd echo No software found.
set/p ein=Filename:
if "%ein%"=="x" goto start
start %ein%
goto start

:changedir
set/p ein=New path: 
if "%ein%"=="x" goto start
cd/d %ein%
goto start

:help
echo.
echo Sunlight-Commander V 0.1
echo run sc.exe with "sc".
echo use numbers to use sc.
echo.
echo sc [Parameter]
echo Parameter: 
echo -info: Information
echo -help: Shows this help

goto ende

:info
echo.
echo Sunlight-Commander V 0.1
echo (C) Luca Franziskowski @ CodingOwl0
echo Version: 0.1
echo.

goto ende

:rename
set/p ein=Filename: 
if "%ein%"=="x" goto start
set/p new=New filename: 
ren "%ein%" "%new%"
goto start

:ende
cd/d %var%


:ende
cd/d %var%

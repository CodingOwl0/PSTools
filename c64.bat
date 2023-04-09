:: I thought it would be cool to have something which looks a bit like the good old c64...
:: You can do what ever you want with it.

@echo off & setlocal & set a=0
:restart
set zaehler=10
color 1f
title C64 BASIC V2
cd/d C:\Windows\System32
cls
echo    **** COMMODORE 64 BASIC V2 ****
echo 64K RAM SYSTEM  38911 BASIC BYTES FREE
echo READY.
:loop
set/p ein=%zaehler% :
set/a zaehler=%zaehler%+10
if "%ein%"==":" set a=1
if "%ein%"=="print" 
if "%ein%"=="run" set a=0
if "%ein%"=="run" call %temp%\file.bat
if "%ein%"=="run" goto restart
if %a%==1 echo %ein% >>%temp%\file.bat
  if %a%==1 goto loop
if "%ein%"=="cls" goto restart
if "%ein%"=="clear" goto restart
%ein%
goto loop

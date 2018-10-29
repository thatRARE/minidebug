:: MIT License
:: thatRARE (c) 2018
:: See LICENSE for details.

@echo off

type pwn.txt
echo.
echo Attaching to Mini World...
timeout /t 5 >nul

SETLOCAL EnableExtensions
:: The Mini World EXE is called iworldpc.exe
set EXE=iworldpc.exe

:: Proccess Checker
FOR /F %%x IN ('tasklist /NH /FI "IMAGENAME eq %EXE%"') DO IF %%x == %EXE% goto FOUND

:: Not Found throws error
type error.txt
echo.
echo Open Mini World before attaching minidebug.
echo Press any key to exit...
pause >nul
goto FIN

:FOUND
echo minidebug has been Attached to Mini World, all Mini World Logs will be printed here.
timeout /t 2 >nul
:: Redirect to the real Debugger
goto DEBUG

:DEBUG
:: Explanation:
:: This :DEBUG state is a Loop that gets the Mini World Log file and types it every 2 seconds.
cls
type %APPDATA%\miniworldOverseasgame\log\all.log
timeout /t 2 >nul
goto DEBUG
:FIN
:: End State

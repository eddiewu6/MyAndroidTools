@echo off
setlocal EnableDelayedExpansion

set device="a9499c22"
set check_timer=20
set dir=logcatDUT/

mkdir logcatDUT
del logcatDUT\* /q/s
set index=0


echo.
echo #############################################
echo Targeted device is: %device%
echo Device check timer is: %check_timer% seconds
echo Logs are saved in: %dir%
echo #############################################
echo.

for /l %%i in (1,1,100000000) do (
	call :check_devices
)
pause


:check_devices
adb devices | findstr %device% > nul
if %errorlevel% == 0 ( echo.
	echo Device exists...
	echo Start logging on %device%
	call :start_logging
	set /A index+=1 ) ELSE ( echo.
	echo Waiting for device %device%... )
timeout %check_timer%
EXIT /B

:start_logging
set fileName=Logcat_all_%index%.txt
echo Log saved as:%dir%%fileName%
adb -s %device% logcat -b all -v threadtime > %dir%%fileName%
EXIT /B
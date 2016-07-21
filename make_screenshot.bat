@echo off
setlocal enabledelayedexpansion

IF NOT EXIST %~dp0\screenshots mkdir %~dp0\screenshots

set HOUR=%time:~0,2%
if %HOUR% EQU  0 set HOUR=00
if %HOUR% EQU  1 set HOUR=01
if %HOUR% EQU  2 set HOUR=02
if %HOUR% EQU  3 set HOUR=03
if %HOUR% EQU  4 set HOUR=04
if %HOUR% EQU  5 set HOUR=05
if %HOUR% EQU  6 set HOUR=06
if %HOUR% EQU  7 set HOUR=07
if %HOUR% EQU  8 set HOUR=08
if %HOUR% EQU  9 set HOUR=09

set TODAY=%date:~6,4%-%date:~3,2%-%date:~0,2%
set TIMENOW=%HOUR%.%time:~3,2%.%time:~6,2%
set FILENAME=screen-%TODAY%-%TIMENOW%.png

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

echo Creating screenshot.
adb -s "!chosendevice!" shell screencap -p /sdcard/%FILENAME% 1> nul
echo Moving screenshot to this directory called "%FILENAME%".
adb -s "!chosendevice!" pull /sdcard/%FILENAME% %~dp0\screenshots\%FILENAME% 1> nul
echo Deleting screenshot from remote device.
adb -s "!chosendevice!" shell rm /sdcard/%FILENAME% 1> nul

echo Done.
timeout 3

:done
@echo off

REM Query the host for connected Android devices. If one is found, install binary into the /system/xbin folder of the device.

setlocal enabledelayedexpansion

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

set BINARY_PATH=%1
set FILENAME=%~nx1

echo Installing !BINARY_PATH! on !chosendevice! at /system/xbin/!FILENAME!
echo Pushing !FILENAME! to devices sdcard
adb -s "!chosendevice!" push %1 /sdcard/!FILENAME!
echo Mounting system
adb -s "!chosendevice!" shell "su -c 'mount -o rw,remount /system'"
echo Copying !FILENAME! to system bin
adb -s "!chosendevice!" shell "su -c 'cp /sdcard/!FILENAME! /system/xbin/!FILENAME!'"
echo Delete copy of !FILENAME! from sdcard
adb -s "!chosendevice!" shell "su -c 'rm /sdcard/!FILENAME!'"
echo Grant permissions for !FILENAME! binary
adb -s "!chosendevice!" shell "su -c 'chmod 777 /system/xbin/!FILENAME!'"
echo Finished
timeout 2
goto :cleanup
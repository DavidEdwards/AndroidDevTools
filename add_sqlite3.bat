@echo off

REM Query the host for connected Android devices. If one is found, install Sqlite3 into the /system/xbin folder of the device.

setlocal enabledelayedexpansion

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

echo Installing Sqlite3 on !chosendevice! at /system/xbin/sqlite3
echo Pushing Sqlite3 to devices sdcard
adb push %~dp0\utilities\sqlite3 /sdcard/sqlite3
echo Mounting system
adb -s "!chosendevice!" shell "su -c 'mount -o rw,remount /system'"
echo Copying Sqlite3 to system bin
adb -s "!chosendevice!" shell "su -c 'cp /sdcard/sqlite3 /system/xbin/sqlite3'"
echo Delete copy of Sqlite3 from sdcard
adb -s "!chosendevice!" shell "su -c 'rm /sdcard/sqlite3'"
echo Grant permissions for Sqlite3 binary
adb -s "!chosendevice!" shell "su -c 'chmod 777 /system/xbin/sqlite3'"
echo Finished
timeout 2
goto :cleanup
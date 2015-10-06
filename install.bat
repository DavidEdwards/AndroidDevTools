@echo off

REM Query the host for connected Android devices. If one is found, continue to install the APK on the device.

setlocal enabledelayedexpansion

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

echo Installing %1 to !chosendevice!
adb -s "!chosendevice!" install -r "%1"
timeout 2
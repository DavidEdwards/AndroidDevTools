@echo off

REM All an Android device to connect by ADB. Run this command once your device has been connected by USB. Then you can connect to it by its IP address.

setlocal enabledelayedexpansion

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

echo Setting TCPIP to 5555 for !chosendevice!
adb -s "!chosendevice!" tcpip 5555 > "%~dp0\wifi_adb.temp"

set /p result=< "%~dp0\wifi_adb.temp"
del "%~dp0\wifi_adb.temp"

echo RESULT IS : !result!

timeout 2
goto :cleanup
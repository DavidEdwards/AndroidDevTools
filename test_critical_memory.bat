@echo off

REM Query the host for connected Android devices. If one is found, send RUNNING_CRITICAL memory signal to App

setlocal enabledelayedexpansion

set ANDROID_SDK=C:\Software\AndroidSDK
set BUILD_TOOLS=24.0.0

call "%~dp0\choose_device.bat"
if not exist "%~dp0\chosendevice.temp" (
	echo "No device was chosen. Aborting."
	exit /b
)

set /p chosendevice=< "%~dp0\chosendevice.temp"
del "%~dp0\chosendevice.temp"

set packagename=none
%ANDROID_SDK%\build-tools\%BUILD_TOOLS%\aapt dump badging test.apk > "%~dp0\tmpFile"
for /f "usebackq tokens=1-2 delims=|" %%a in (%~dp0\tmpFile) do (
	for /f "delims=	" %%b in ("%%a") do (
		for /f "tokens=2 delims='" %%c in ("%%b") do (
			set packagename=%%~c
			goto packagefound
		)
	)
)
:packagefound
del %~dp0\tmpFile

echo Sending RUNNING_CRITICAL memory signal to "%packagename%" on !chosendevice!
adb shell am send-trim-memory %packagename% RUNNING_CRITICAL
timeout 2
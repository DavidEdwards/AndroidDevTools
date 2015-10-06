@echo off

REM Pick a connected Android device. If there is one, automatically selected it. If there are many, give a list to choose.

setlocal enabledelayedexpansion
"%~dp0\tools\adb.exe" start-server 1> nul

set chosendevice=Default
set device[0]=NotADevice
set /a c=0

adb devices > "%~dp0\tmpFile"
for /f "usebackq skip=1 tokens=1-2 delims=|" %%a in (%~dp0\tmpFile) do (
	for /f "delims=	" %%b in ("%%a") do (
		set /a c=!c!+1
		set device[!c!]=%%b
	)
)
del %~dp0\tmpFile

if !c!==0 (
	echo There are no devices connected.
	set /p ip=Please enter the IP address of a device: 
	echo Connecting to... !ip!
	"%~dp0\Tools\adb.exe" connect !ip!
	
	set /a c=0
	adb devices > "%~dp0\tmpFile"
	for /f "usebackq skip=1 tokens=1-2 delims=|" %%a in (%~dp0\tmpFile) do (
		for /f "delims=	" %%b in ("%%a") do (
			set /a c=!c!+1
			set device[!c!]=%%b
		)
	)
	del %~dp0\tmpFile
	
	if !c!==0 (
		echo Failed to connect.
		timeout 5
		goto :error
	)
)

if !c!==1 (
	echo There is only one device.
	echo.
	echo Using !device[1]!.
	set chosendevice=!device[1]!
	goto :continue
) else (
	echo Please enter the number of the device you would like to use
)
echo.

for /l %%n in (1,1,!c!) do (
	echo  %%n. !device[%%n]!
)

if !c!==1 (
	echo One device! No choice required.
) else (
	set /p "num=# "
	
 	if !num! gtr %c% (
 		echo !num! is too high a value. The device does not exist.
 		goto :error
 	) else if !num! leq 0 (
 		echo !num! is too low a value. The device does not exist.
 		goto :error
 	)
	
	for /l %%n in (!num!,1,!num!) do (
		echo.
		echo Use device !device[%%n]!
		
		set chosendevice=!device[%%n]!
		goto :continue
	)
)

:error
exit /b

:continue
echo !chosendevice!> "%~dp0\chosendevice.temp"
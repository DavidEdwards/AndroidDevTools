REM Sign the provided APK and install it onto a connected Android device.

@echo off

call "%~dp0\sign.bat" "%1"
call "%~dp0\install.bat" "%1"
pause
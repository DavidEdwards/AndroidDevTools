@echo off

REM Query the host for connected Android devices. If one is found, send critical memory levels to App

setlocal enabledelayedexpansion

set ANDROID_SDK=C:\Software\AndroidSDK
set BUILD_TOOLS=24.0.0
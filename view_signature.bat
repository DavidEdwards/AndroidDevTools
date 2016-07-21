@echo off

REM Read the certificates of a given APK

keytool -list -printcert -jarfile "%1"

pause
del o.reg

set LINE1=Windows Registry Editor Version 5.00
set LINE2=[-HKEY_CURRENT_USER\SOFTWARE\Classes\apk_auto_file\shell\Install APK]

echo %LINE1% >> o.reg
echo.>>o.reg
echo %LINE2% >> o.reg

regedit /s %~dp0\o.reg

del o.reg
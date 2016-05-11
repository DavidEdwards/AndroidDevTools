del o.reg

set BATPATH=%~dp0..\
set BATPATH=%BATPATH:\=\\%

set LINE1=Windows Registry Editor Version 5.00
set LINE2=[HKEY_CURRENT_USER\SOFTWARE\Classes\apk_auto_file\shell\Install APK]
set LINE3=[HKEY_CURRENT_USER\SOFTWARE\Classes\apk_auto_file\shell\Install APK\command]
rem set LINE4=@="%BATPATH%install.bat %%1"
set LINE4=@="\"%BATPATH%install.bat\" \"%%1\""

echo %LINE1% >> o.reg
echo.>>o.reg
echo %LINE2% >> o.reg
echo.>>o.reg
echo %LINE3% >> o.reg
echo %LINE4% >> o.reg

regedit /s %~dp0\o.reg

del o.reg
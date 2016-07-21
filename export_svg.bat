@echo off

SET INKSCAPE="C:\Program Files (x86)\Inkscape\inkscape.exe"

if not exist %INKSCAPE% (
	echo Could not find the Inkscape executable at %INKSCAPE%. Please update this batch file.
	pause
	exit /b 1
)

if not exist "%1" (
	echo Error. You did not provide an SVG to export.
	pause
	exit /b 1
)

echo Checking drawable directories and creating if necessary
if not exist "svg.%~n1.output" mkdir svg.%~n1.output
if not exist "svg.%~n1.output\launcher" mkdir svg.%~n1.output\launcher
if not exist "svg.%~n1.output\launcher\drawable-mdpi" mkdir svg.%~n1.output\launcher\drawable-mdpi
if not exist "svg.%~n1.output\launcher\drawable-hdpi" mkdir svg.%~n1.output\launcher\drawable-hdpi
if not exist "svg.%~n1.output\launcher\drawable-xhdpi" mkdir svg.%~n1.output\launcher\drawable-xhdpi
if not exist "svg.%~n1.output\launcher\drawable-xxhdpi" mkdir svg.%~n1.output\launcher\drawable-xxhdpi
if not exist "svg.%~n1.output\launcher\drawable-xxxhdpi" mkdir svg.%~n1.output\launcher\drawable-xxxhdpi
if not exist "svg.%~n1.output\action" mkdir svg.%~n1.output\action
if not exist "svg.%~n1.output\action\drawable-mdpi" mkdir svg.%~n1.output\action\drawable-mdpi
if not exist "svg.%~n1.output\action\drawable-hdpi" mkdir svg.%~n1.output\action\drawable-hdpi
if not exist "svg.%~n1.output\action\drawable-xhdpi" mkdir svg.%~n1.output\action\drawable-xhdpi
if not exist "svg.%~n1.output\action\drawable-xxhdpi" mkdir svg.%~n1.output\action\drawable-xxhdpi
if not exist "svg.%~n1.output\action\drawable-xxxhdpi" mkdir svg.%~n1.output\action\drawable-xxxhdpi
if not exist "svg.%~n1.output\ordinary" mkdir svg.%~n1.output\ordinary
if not exist "svg.%~n1.output\ordinary\drawable-mdpi" mkdir svg.%~n1.output\ordinary\drawable-mdpi
if not exist "svg.%~n1.output\ordinary\drawable-hdpi" mkdir svg.%~n1.output\ordinary\drawable-hdpi
if not exist "svg.%~n1.output\ordinary\drawable-xhdpi" mkdir svg.%~n1.output\ordinary\drawable-xhdpi
if not exist "svg.%~n1.output\ordinary\drawable-xxhdpi" mkdir svg.%~n1.output\ordinary\drawable-xxhdpi
if not exist "svg.%~n1.output\ordinary\drawable-xxxhdpi" mkdir svg.%~n1.output\ordinary\drawable-xxxhdpi
if not exist "svg.%~n1.output\market" mkdir svg.%~n1.output\market

echo Generating mdpi launcher icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\launcher\drawable-mdpi\ic_launcher.png" -C -w 48 -h 48
echo Generating hdpi launcher icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\launcher\drawable-hdpi\ic_launcher.png" -C -w 72 -h 72
echo Generating xhdpi launcher icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\launcher\drawable-xhdpi\ic_launcher.png" -C -w 96 -h 96
echo Generating xxhdpi launcher icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\launcher\drawable-xxhdpi\ic_launcher.png" -C -w 144 -h 144
echo Generating xxxhdpi launcher icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\launcher\drawable-xxxhdpi\ic_launcher.png" -C -w 192 -h 192

echo Generating mdpi action icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\action\drawable-mdpi\ic_action_%~n1.png" -C -w 24 -h 24
echo Generating hdpi action icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\action\drawable-hdpi\ic_action_%~n1.png" -C -w 36 -h 36
echo Generating xhdpi action icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\action\drawable-xhdpi\ic_action_%~n1.png" -C -w 48 -h 48
echo Generating xxhdpi action icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\action\drawable-xxhdpi\ic_action_%~n1.png" -C -w 72 -h 72
echo Generating xxxhdpi action icon
%INKSCAPE% -f "%1" -e "svg.%~n1.output\action\drawable-xxxhdpi\ic_action_%~n1.png" -C -w 96 -h 86


echo Generating mdpi ordinary icons
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-mdpi\ic_action_%~n1_18dp.png" -C -w 18 -h 18
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-mdpi\ic_action_%~n1_24dp.png" -C -w 24 -h 24
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-mdpi\ic_action_%~n1_36dp.png" -C -w 36 -h 36
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-mdpi\ic_action_%~n1_48dp.png" -C -w 48 -h 48
echo Generating hdpi ordinary icons
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-hdpi\ic_action_%~n1_18dp.png" -C -w 27 -h 27
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-hdpi\ic_action_%~n1_24dp.png" -C -w 36 -h 36
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-hdpi\ic_action_%~n1_36dp.png" -C -w 54 -h 54
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-hdpi\ic_action_%~n1_48dp.png" -C -w 72 -h 72
echo Generating xhdpi ordinary icons
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xhdpi\ic_action_%~n1_18dp.png" -C -w 36 -h 36
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xhdpi\ic_action_%~n1_24dp.png" -C -w 48 -h 48
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xhdpi\ic_action_%~n1_36dp.png" -C -w 72 -h 72
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xhdpi\ic_action_%~n1_48dp.png" -C -w 96 -h 96
echo Generating xxhdpi ordinary icons
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxhdpi\ic_action_%~n1_18dp.png" -C -w 54 -h 54
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxhdpi\ic_action_%~n1_24dp.png" -C -w 72 -h 72
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxhdpi\ic_action_%~n1_36dp.png" -C -w 108 -h 108
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxhdpi\ic_action_%~n1_48dp.png" -C -w 144 -h 144
echo Generating xxxhdpi ordinary icons
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxxhdpi\ic_action_%~n1_18dp.png" -C -w 72 -h 72
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxxhdpi\ic_action_%~n1_24dp.png" -C -w 96 -h 96
%INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxxhdpi\ic_action_%~n1_36dp.png" -C -w 144 -h 144
REM %INKSCAPE% -f "%1" -e "svg.%~n1.output\ordinary\drawable-xxxhdpi\ic_action_%~n1_48dp.png" -C -w 192 -h 192
echo Generating market drawables
%INKSCAPE% -f "%1" -e "svg.%~n1.output\market\512x512.png" -C -w 512 -h 512




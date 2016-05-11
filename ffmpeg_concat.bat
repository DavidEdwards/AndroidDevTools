@echo off

del concat_list.txt

if [%1]==[] goto :eof
:loop
echo Adding %~n1 to the concatenation list
echo file '%1' >> concat_list.txt
shift
if not [%1]==[] goto loop

echo Running ffmpeg
ffmpeg -y -f concat -i concat_list.txt -c copy output.mp4 >nul 2>&1

echo Cleanup temporary files
del concat_list.txt
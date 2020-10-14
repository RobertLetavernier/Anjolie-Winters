@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set cmdname=%~n0
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: Split cmdname on " " (single white space)
set "name2=%cmdname:* =%"
for /F "tokens=1 delims= " %%F IN ("%cmdname%") do set "name1=%%F"
echo name1 - %name1%
echo name2 - %name2%

TITLE Phpache launcher %name1% / %name2%
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

PATH %PATH%;C:\Programz\%name2%\
C:\Programz\%name1%\bin\httpd.exe
timeout 5

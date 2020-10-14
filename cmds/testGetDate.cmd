@echo off
title Test getDate.cmd
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
for /f "tokens=*" %%i in ('getDate.cmd') do set fulldate=%%i

echo %fulldate%

set y=%fulldate:~0,4%
set m=%fulldate:~5,2%
set d=%fulldate:~8,2%

set h=%fulldate:~11,2%
set i=%fulldate:~14,2%
set s=%fulldate:~17,2%
set u=%fulldate:~20,2%

echo Y-m-d : %y%-%m%-%d% %h%:%i%:%s%,%u%
echo d/m/Y : %d%/%m%/%y% %h%_%i%_%s%.%u%

pause
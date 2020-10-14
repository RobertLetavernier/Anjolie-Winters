@echo off
TITLE Scanamatron
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: config ::
set  elements=_sources.txt
set  thisRoot=%~dp0
set  elemtDir=%thisRoot%wd\
Setlocal EnableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: call subroutines ::
if [%1] == [/append] goto append
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: Main ::
del %thisRoot%%elements%
FORFILES /p %elemtDir% /c "cmd /c call "%~f0" /append @file"
goto end
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: append ::
:append
set output=%~2
set output=%output%#
set output=%output%%~2

echo %~2
>> %thisRoot%%elements% echo %output%
goto :eof
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: end ::
:end
echo this is the end
pause
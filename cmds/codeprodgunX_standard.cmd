title Build exports
setlocal enableDelayedExpansion
@echo off

set foldername=%~n0

:: Split foldername on "_"
set "filename2=%foldername:*_=%"
for /F "tokens=1 delims=_" %%F IN ("%foldername%") do set "filename1=%%F"
echo filename1 - %filename1%
echo filename2 - %filename2%

mkdir %foldername%

:: Build appender
echo @echo off                                                  > ap.cmd
echo copy %%1 %foldername%\%filename1%_p%%~n1_%filename2%%%~x1 >> ap.cmd

:: Append files with the appender
forfiles /m *.jpg /C "cmd /c ap.cmd @file"
forfiles /m *.pdf /C "cmd /c ap.cmd @file"

:: Delete appender
del ap.cmd

endlocal
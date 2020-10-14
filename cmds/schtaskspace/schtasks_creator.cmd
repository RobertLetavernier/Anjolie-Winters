@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
TITLE schtasks creator
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set    report=%~dp0
set    report=%report%_schtasks_report.txt
set    getDatePath=_config_getDate.cmd
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

CALL %getDatePath% > %report%

echo [0] current     : %~dp0
echo [1] folder path : %1
echo [2] /ru (user)  : %2
echo [3] /rp (pass)  : %3
REM pause
REM goto :EOF

:: Build appender
:: %% escapes %
:: ^> escapes >
:: %~1 Removes quotes from the first command line argument
:: %~n1 extends %1 in filename only
>  ap.cmd echo @echo off
>> ap.cmd echo echo Schtasking %%~1
>> ap.cmd echo ^>^> %report% echo Schtasking %%~1
>> ap.cmd echo echo schtasks /create /xml "%~dp0%1\%%~1" /tn "arsia\%1\%%~n1" /ru %2 /rp %3

:: Append files
set appender=%~dp0
set appender=%appender%ap.cmd
forfiles /p %~dp0%1 /C "cmd /c %appender% @file"

:: Delete appender
REM del ap.cmd

CALL %getDatePath% >> %report%

REM MSG * "Kaleidobulkatron has come to an end"

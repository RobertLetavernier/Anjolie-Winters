@echo off
Setlocal EnableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

set optdir=%~dp0%1
set optfile=%2

echo dir  [%optdir%]
echo file [%optfile%]

IF DEFINED optfile goto VAL_FILE
:OPT_FILE

set ctp1=0
for %%F IN (%optdir%\*.cmd) do (
    set /a ctp1=!ctp1!+1
	set "string=    [!ctp1!]"
	set string=!string:~-5! %%~nF
	echo  !string!
	REM echo  [!ctp1!] : %%~nF
)
REM goto :eof
set /P optfile=Choix:

:VAL_FILE
echo choosen opt [%optfile%]

set ctp2=0
for %%F IN (%optdir%\*.cmd) do (
    set /a ctp2=!ctp2!+1
	echo [%optfile%] == [!ctp2!]
	if !ctp2! EQU %optfile% (
		call "%%F"
		goto THE_END
	)
)
goto OPT_FILE
:THE_END

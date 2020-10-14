@echo off
set mytitle=Livr-etor
TITLE %mytitle%

:: ****************************************************************************
:: ****                          NUL call                                  ****
:: ****************************************************************************
if [%1]==[] (
	echo Missing Param
	pause 
	goto :eof
)

:: ****************************************************************************
:: ****                           CONFIG                                   ****
:: ****************************************************************************
for %%F IN (_config_*.cmd) do CALL "%%F"

:: ****************************************************************************
:: ****                      EXPAND RUN PARAMS                             ****
:: ****************************************************************************
set dateIsoStr=%_yyyy%%_mm%%_dd%
set dateFraStr=%_dd%/%_mm%/%_yyyy%
set prev3pVers=%~1
set next3pVers=%~2
set remoteFold=%~n2

:: expand target version + leading zeroes
for /F "tokens=1-3 delims=." %%F IN ("%next3pVers%") do (
	set vMaj=%%F
	set vMin=%%G
	set vPak=%%H
)

set next3pVersPatch=00%vPak%
set next3pVersPatch=%next3pVersPatch:~-2%
set next3pVersPatch=00%vMin%%next3pVersPatch%
set next3pVersPatch=%next3pVersPatch:~-4%
set next3pVersPatch=%vMaj%%next3pVersPatch%

:: ****************************************************************************
:: ****                             RUN                                    ****
:: ****************************************************************************

::build_wd
mkdir %workingDir%\%vMaj%\%vMaj%.%vMin%\%next3pVers%
set workingDir=%workingDir%\%vMaj%\%vMaj%.%vMin%\%next3pVers%

::run
for %%F IN (_run_*.cmd) do CALL "%%F"

REM rd /s /q %workingDir%


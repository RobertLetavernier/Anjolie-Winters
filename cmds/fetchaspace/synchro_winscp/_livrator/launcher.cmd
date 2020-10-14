@echo off
set mytitle=Livrator
TITLE %mytitle%

:: ****************************************************************************
:: ****                           CONFIG                                   ****
:: ****************************************************************************
for %%F IN (_config_*.cmd) do CALL "%%F" "%mytitle%"

:: ****************************************************************************
:: ****                             RUN                                    ****
:: ****************************************************************************

::build_wd
mkdir %pakrootDir%\%_filedate%
set workingDir=%pakrootDir%\%_filedate%
::run
> output.log echo Start @ %_isoday% / %_isohour%
for %%F IN (_run_*.cmd) do echo calling %%F & CALL "%%F" "%mytitle%" >> output.log

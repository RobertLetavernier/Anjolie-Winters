@echo off
title Show connected users
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: ------------------------------------------------------------ Config SQL ----

:: Name of the table to dump separated by ,
set    schemas=sygesp_interne, sygesp_externe

:: sql user and password to use. /P is the "prompt" switch
set    sqluser=root
set /P sqlpass=Enter SQL password for user "%sqluser%": 

set    sqlfile=query.sql

:: ------------------------------------------------------------------- Run ----
:loopstart
cls
:: Backuping each SQL schema
echo select                                                  > %sqlfile%
echo    usrIdx as ID,                                       >> %sqlfile%
echo    usrConnected as "up?",                              >> %sqlfile%
echo    TIMEDIFF(NOW(), usrLastAccess) as "last access",    >> %sqlfile%
echo    usrLogin                                            >> %sqlfile%
echo from syge_utilisateur                                  >> %sqlfile%
echo order by usrLastAccess desc limit 0,5;                 >> %sqlfile%

set _options=-u%sqluser% -p%sqlpass%
FOR %%G IN (%schemas%) DO (
    echo -------------------------------------------------
    echo Users on %%G
    echo -------------------------------------------------
    mysql %_options% %%G < %sqlfile%)

del %sqlfile%

:: ------------------------------------------------------------------- END ----
echo End. Press any key to redo.
pause>nul

GOTO loopstart
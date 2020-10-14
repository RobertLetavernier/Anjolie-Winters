@echo off
title DumbLoop 2000
:loopstart
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: ------------------------------------------------------------------- EXE ----
set exePath=C:\Programz\php_5.3.28\php.exe 
REM set exePath=C:\Programz\apache24_php7_x86\php7\php.exe

:: -------------------------------------------------------------- INSTANCE ----
:: 3p
REM set instancePath=E:\www\3p\218\
REM set instancePath=E:\www\3p\219\
set instancePath=E:\www\3p\301\
REM set instancePath=E:\www\3p\302\

:: Sy
REM set instancePath=E:\www\sy\Havas\stable\
REM set instancePath=E:\www\sy\Gun\246\

:: Ia
REM set instancePath=E:\www\ia\3.0\_standard_3.0.0\
REM set instancePath=E:\www\ia\3.0\carrefour_market_3.0.0\
REM set instancePath=E:\www\ia\3.0\allibert_3.0.1\
REM set instancePath=E:\www\ia\3.0\allibert_3.0.2\
REM set instancePath=E:\www\ia\allibert\qualif\

:: ---------------------------------------------------------------- SCRIPT ----
::3p 
REM set scriptPath=cron\processEvent_28.php
REM set scriptPath=cron\importVisual.php
set scriptPath=cron\_processEvent.php
REM set scriptPath=cron\processEvent_generic.php

:: Sy
REM set scriptPath=..\pimdatamanager\cron\queue_manager.php
REM set scriptPath=..\pimdatamanager\cron\mediadata.php
REM set scriptPath=cron\reorganize_flatplan\reorganize_flatplan.php
REM set scriptPath=cron\export\Export.php 1
REM set scriptPath=cron\mediadata\import_csv.php
REM set scriptPath=dev\cron\generation\update_version.php 1
REM set scriptPath=cron\kiosk\synchronize_kiosk.php

:: Ia
REM set scriptPath=pimdatamanager\cron\queue_manager.php
REM set scriptPath=pimdatamanager\cron\mediadata.php
REM set scriptPath=dev\cron\export\Export.php 1
REM set scriptPath=cron\mediadata\import_csv.php
REM set scriptPath=dev\cron\generation\update_version.php 1
REM set scriptPath=dev\cron\kiosk\synchronize_kiosk.php

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
    cls
    echo ------------------------------------------------------
    echo RUN %time%
    echo  - %exePath%
    echo  - %instancePath%
    echo  - %scriptPath%
    echo ------------------------------------------------------
    REM %exePath% --ini
    REM echo ------------------------------------------------------
    %exePath% %instancePath%%scriptPath%
    REM pause
GOTO loopstart
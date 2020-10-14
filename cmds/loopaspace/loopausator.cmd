@echo off
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:: ------------------------------------------------------------------- EXE ----
REM set exePath=C:\Programz\php_5.3.28\php.exe 
set exePath=C:\Programz\apache24_php7_x86\php7\php.exe

:: -------------------------------------------------------------- INSTANCE ----
set instancePath=%~dp0

:: ---------------------------------------------------------------- SCRIPT ----
::3p 
REM set scriptPath=cron\importVisual.php
REM set scriptPath=cron\_processEvent.php
REM set scriptPath=cron\processEvent_28.php

::Sy / Ia
set scriptPath=pimdatamanager\cron\queue_manager.php
REM set scriptPath=dev\cron\export\Export.php
REM set scriptPath=dev\cron\generation\update_version.php 1
REM set scriptPath=dev\setup\patcher.php

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
title %scriptPath%
:loopstart
    cls
    echo ------------------------------------------------------
    echo RUN %time%
    echo  - %exePath%
    echo  - %instancePath%
    echo  - %scriptPath%
    echo ------------------------------------------------------
    %exePath% %instancePath%%scriptPath%
    pause
GOTO loopstart
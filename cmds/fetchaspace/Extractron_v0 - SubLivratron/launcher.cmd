@echo off
title SubLivratron
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set folder=_out
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo Emptying folder "%folder%"

RD /S /Q %folder%
MD %folder%

C:\Programz\apache24_php71_x64\php_7.1.10\php.exe script.php
pause

@echo off
c:
cd C:\Programz\apache24_php71_x64\Apache24\bin
PATH C:\Programz\apache24_php71_x64\php_7.1.10;C:\Programz\apache24_php71_x64\php_7.1.10\ext;%PATH%
title Apache 2.4.0 - php 7.1.10 (x64)
echo Apache 2.4.0 - php 7.1.10 (x64)
httpd.exe
timeout 5
pause
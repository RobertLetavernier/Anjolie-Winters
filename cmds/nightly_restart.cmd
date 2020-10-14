@echo off
rem MUST BE RUN WITH ADMINISTRATOR PRIVILEGES (Windows Services are restarted)
for /F "tokens=1-3 delims=/ " %%i in ('date /t') do (set CURRENTDATE=%%k-%%j-%%i)
set LOG_FILE=D:\logs\nightly_restart\%CURRENTDATE%.log

echo ########## %CURRENTDATE% %TIME% :  stop / disable tasks > %LOG_FILE%

forfiles /p C:\windows\system32\tasks\sygesp /C "cmd /c schtasks /End /TN \sygesp\\@file >> %LOG_FILE%"
forfiles /p C:\windows\system32\tasks\sygesp /C "cmd /c schtasks /Change /Disable /TN \sygesp\\@file >> %LOG_FILE%"

echo ########## %CURRENTDATE% %TIME% :  stop services >> %LOG_FILE%
REM 2018-07-16 - desactivation de l'arret / relance de iis
REM net stop W3SVC  >> %LOG_FILE%
net stop MySQL55  >> %LOG_FILE%

echo ########## %CURRENTDATE% %TIME% :  stop tomcat / ids >> %LOG_FILE%

REM il semble que le net stop n'arrete pas le processus
REM net stop Tomcat7_mediadata >> %LOG_FILE%
sc stop  Tomcat7_mediadata >> %LOG_FILE%
c:\sygesp\bin\curl\curl.exe -s -L "[some_url]" >> %LOG_FILE%
net stop Tomcat7_ids >> %LOG_FILE%
taskkill /F /IM Tomcat7_ids.exe /T >> %LOG_FILE%
taskkill /F /IM Tomcat7_mediadata.exe /T >> %LOG_FILE%
taskkill /F /IM InDesignServer.exe /T >> %LOG_FILE%
timeout 5

echo ########## %CURRENTDATE% %TIME% :  start tomcat / ids >> %LOG_FILE%
net start Tomcat7_mediadata >> %LOG_FILE%
net start Tomcat7_ids >> %LOG_FILE%
timeout 5
c:\sygesp\bin\curl\curl.exe -s -L "[some_url]" >> %LOG_FILE%

echo ########## %CURRENTDATE% %TIME% :  start services >> %LOG_FILE%

net start MySQL55  >> %LOG_FILE%

REM 2018-07-16 - desactivation de l'arret / relance de iis
REM net start W3SVC  >> %LOG_FILE%

echo ########## %CURRENTDATE% %TIME% :  full MySQL backup >> %LOG_FILE%
"C:\Program Files\MySQL\MySQL Server 5.5\bin\mysqldump" -uroot -pp455w*rd --all-databases > D:\dbdump_%CURRENTDATE%.db
echo MySQL dump ended at %CURRENTDATE% %TIME% >> %LOG_FILE%
C:\sygesp\bin\7zip\7za.exe a -y -mx1 D:\db_backups\%CURRENTDATE%.zip D:\dbdump_%CURRENTDATE%.db >> %LOG_FILE%
echo Archive end at %CURRENTDATE% %TIME% >> %LOG_FILE%
del D:\dbdump_%CURRENTDATE%.db >> %LOG_FILE%
rem remove backups older than 20 days
forfiles /p d:\db_backups\ /m *.zip /D -20 /C "cmd /c del /s /f /q @path"

:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Une réplication du serveur de prod est faite sur le serveur de qualif ::
:: Il faut vérifier que le backup du serveur de qualif est faite         ::
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
REM C:\sygesp\bin\FreeFileSync\FreeFileSync.exe "C:\sygesp\bin\FreeFileSync\backup_nightly.ffs_batch" >> %LOG_FILE%


echo Upload end %CURRENTDATE% %TIME% >> %LOG_FILE%

echo ########## %CURRENTDATE% %TIME% :  restart tasks >> %LOG_FILE%
forfiles /p C:\windows\system32\tasks\sygesp /C "cmd /c schtasks /Change /Enable /TN \sygesp\\@file >> %LOG_FILE%"

echo ########## %CURRENTDATE% %TIME% :  clean folders >> %LOG_FILE%

forfiles /p d:\logs\ /s /m *.txt /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p d:\logs\ /s /m *.log /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p d:\logs\ /s /m *.log.* /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p C:\sygesp\bin\tomcat7_ids\logs\ /s /m *.log /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p C:\sygesp\bin\tomcat7_ids\logs\ /s /m *.txt /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p C:\sygesp\bin\tomcat7_mediadata\logs\ /s /m *.log /D -20 /C "cmd /c del /q /s /f /q @path"
forfiles /p C:\sygesp\bin\tomcat7_mediadata\logs\ /s /m *.txt /D -20 /C "cmd /c del /q /s /f /q @path"

forfiles /p d:\idsconnector\books\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir d:\idsconnector\books\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p d:\idsconnector\export\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir d:\idsconnector\export\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p d:\idsconnector\import\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir d:\idsconnector\import\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p D:\sygesp_interne\temp\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir D:\sygesp_interne\temp\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p D:\sygesp_externe\temp\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir D:\sygesp_externe\temp\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p C:\sygesp\temp\ /s /m *.* /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir C:\sygesp\temp\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

forfiles /p C:\Windows\temp\ /m *.* /D -5 /C "cmd /c del /s /f /q @path"
forfiles /p C:\Windows\temp\ /m * /D -5 /C "cmd /c del /s /f /q @path"
for /f "delims=" %%d in ('dir C:\Windows\temp\ /s /b /ad ^| sort /r') do (rd /Q "%%d")

rem WARNING: must NOT be recursive and NOT sorted (for performance reasons)
for /f "delims=" %%d in ('dir D:\idsconnector\working_files\ /b /ad') do (@rd /Q D:\idsconnector\working_files\%%d)

:end

echo ########## %CURRENTDATE% %TIME% : end >> %LOG_FILE%

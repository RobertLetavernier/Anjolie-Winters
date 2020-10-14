@echo off
Setlocal EnableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
CALL _config_getDate.cmd %~dp0

:: ----------------------------------------------------------- Base Config ----
set    logfile=D:\arsia\common\logs\restart_%_filedate%.log
set    curlexe=C:\arsia\bin\curl\curl.exe --connect-timeout=10 --max-time 60 -s -L


:: ------------------------------------------------------ Config Instances ----
set    tclog=bin\tomcat8_idsconnector\logs
:: Name of the instances value separated by , 
set    instance_name=demo1                 , demo2                 , demo3                 , demo4                 , demo5                 , demo6                 , demo7                 
set    tcatsrvc_port=8180                  , 8280                  , 8380                  , 8480                  , 8580                  , 8680                  , 8780                  
set    tcatsrvc_name=tomcat8_demo1         , tomcat8_demo2         , tomcat8_demo3         , tomcat8_demo4         , tomcat8_demo5         , tomcat8_demo6         , tomcat8_demo7         
set    purgedir_n[0]=D:\arsia\demo1\logs   , D:\arsia\demo2\logs   , D:\arsia\demo3\logs   , D:\arsia\demo4\logs   , D:\arsia\demo5\logs   , D:\arsia\demo6\logs   , D:\arsia\demo7\logs   
set    purgedir_n[1]=C:\arsia\demo1\%tclog%, C:\arsia\demo2\%tclog%, C:\arsia\demo3\%tclog%, C:\arsia\demo4\%tclog%, C:\arsia\demo5\%tclog%, C:\arsia\demo6\%tclog%, C:\arsia\demo7\%tclog%
set    purgedir_n[2]=D:\arsia\common\logs
set    purgedir_nend=2

:: ------------------------------------------------------------------- Run ----

:first_log
>  %logfile% echo Start @%_isohour%
>> %logfile% echo Configured instances are :
FOR %%G IN (%instance_name%) DO (
	>> %logfile% echo "%%G"
)

:adminCleanClose
FOR %%G IN (%tcatsrvc_port%) DO (
	>> %logfile% echo @ %time% adminCleanClose %%G
	>> %logfile% %curlexe% "http://127.0.0.1:%%G/axis2_1_7_6/services/InDesignService/"
)

:net_stop
FOR %%G IN (%tcatsrvc_name%) DO (
	>> %logfile% echo @ %time% net stop %%G
	>> %logfile% net stop %%G
)

:task_kill
FOR %%G IN (%tcatsrvc_name%) DO (
	>> %logfile% echo @ %time% taskkill %%G
	>> %logfile% taskkill /F /IM %%G.exe /T
)

FOR /L %%H IN (0,1,%purgedir_nend%) DO (
	FOR %%G IN (!purgedir_n[%%H]!) DO (
		>> %logfile% echo @ %time% purging %%G
		>> %logfile% forfiles /p %%G /s /m *.log /D -30 /C "cmd /c del /q /s /f /q @path"
		>> %logfile% forfiles /p %%G /s /m *.txt /D -30 /C "cmd /c del /q /s /f /q @path"
	)
)

:net_start
FOR %%G IN (%tcatsrvc_name%) DO (
	>> %logfile% echo @ %time% net start %%G
	>> %logfile% net start %%G
)

:last_log
>>  %logfile% echo Done @%_isohour%

IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: -------------------------------------------------------------------- I/O ----
set sourceRoot=https://lisbonne/svn/goaland_siteweb/branches/web2_2
set workingDir=D:\www\src\goaland\web\_pak
set synchroDir=D:\www\src\goaland\web\_pak\_backup
set winscpOpen=ftp://dl:dl@192.168.0.41
set dropFolder=/hotfolder

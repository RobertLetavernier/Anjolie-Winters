IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: -------------------------------------------------------------------- I/O ----
REM set sourceRoot=https://lisbonne/svn/rb_intranet/branches/rb_intranet_1.8
set pakrootDir=%~dp0..
set backupsDir=%~dp0..\_backup
set backupMask=-filemask="| *subfolder_22/"
set winscpOpen=ftp://dl:dl@192.168.0.41
set dropFolder=/synchro_testmask

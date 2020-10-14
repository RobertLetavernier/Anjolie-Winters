IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: -------------------------------------------------------------------- I/O ----
set sourceRoot=https://amsterdam/svn/goaland_siteweb/branches/web2_2
set dtemplRoot=https://amsterdam/svn/goaland_siteweb/branches/web2_2/deploy_template
set pakrootDir=%~dp0..
set backupsDir=%~dp0..\_backup
set backupMask=-filemask="| */media/"
set winscpOpen=ftp://webpublisher:aP35R2FWtKy6GNGsLZBU@51.38.227.157
set dropFolder=/to_install_v2

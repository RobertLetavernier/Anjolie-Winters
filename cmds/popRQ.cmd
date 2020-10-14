@echo off
title Pop RQ
echo Rapport time !
call "D:\www\scripts\cmd\_config_getDate.cmd" RQ
call D:\www\scripts\cmd\subverscan.cmd %_isoday% > D:\www\datas\logs\comits_%_isoday%.log
more D:\www\datas\logs\comits_%_isoday%.log
"C:\Program Files (x86)\Google\Chrome\Application\chrome" http://bm.goaland.com/admin/module/dailyreport/form.php?mode=insert
REM start microsoft-edge:https://bm2.goaland.com/admin/module/dailyreport/lookup.php?date=%_isoday%
pause>nul
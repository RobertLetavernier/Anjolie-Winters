IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ------------------------------------------------ Transmit package to ftp ----

>  tmp_cmd.ftp echo open %winscpOpen%
>> tmp_cmd.ftp echo synchronize local -delete -mirror %backupsDir% %dropFolder% %backupMask%
>> tmp_cmd.ftp echo exit

%scpExePath% /script=tmp_cmd.ftp
del tmp_cmd.ftp


IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
echo %~0
:: ------------------------------------------------ Transmit package to ftp ----
>  tmp_cmd.ftp echo open %winscpOpen%
>> tmp_cmd.ftp echo synchronize remote -mirror %workingDir%/src %dropFolder%
>> tmp_cmd.ftp echo exit

%scpExePath% /script=tmp_cmd.ftp
del tmp_cmd.ftp
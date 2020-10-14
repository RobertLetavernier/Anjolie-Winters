IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: -------------------------------------------- tansmit synchro green light ----
:: tansmit synchro green light
echo|set /p="TODO">%workingDir%\synchro.txt

>  tmp_cmd.ftp echo open %winscpOpen%
>> tmp_cmd.ftp echo put %workingDir%\synchro.txt %dropFolder%/synchro.txt 
>> tmp_cmd.ftp echo exit

%scpExePath% /script=tmp_cmd.ftp
del tmp_cmd.ftp
:: ------------------------------------------------ Transmit package to ftp ----

>  tmp_cmd.ftp echo open %ftpOutOpen%
>> tmp_cmd.ftp echo %ftpOutUser%
>> tmp_cmd.ftp echo %ftpOutPass%
>> tmp_cmd.ftp echo binary
>> tmp_cmd.ftp echo  cd %ftpOutFold%
>> tmp_cmd.ftp echo lcd %workingDir%
>> tmp_cmd.ftp echo put Easy3p_maj_%prev3pVers%_vers_%next3pVers%.zip
>> tmp_cmd.ftp echo put Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf
>> tmp_cmd.ftp echo quit

ftp < tmp_cmd.ftp

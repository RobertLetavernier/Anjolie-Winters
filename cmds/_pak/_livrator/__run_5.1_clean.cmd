IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ------------------------------------------------------ Clean working dir ----

rd /s /q %workingDir%
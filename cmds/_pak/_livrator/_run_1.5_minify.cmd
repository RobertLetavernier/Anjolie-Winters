IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ----------------------------------------------------- update vers number ----
%minifyPath% --src %workingDir%\src
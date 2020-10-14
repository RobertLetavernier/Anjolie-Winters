IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ----------------------------------------------------------- build source ----
::retrieve_htdocs

REM rd /s /q %workingDir%\src\media
%svnExePath% export --force %dtemplRoot%/media %workingDir%\src\media

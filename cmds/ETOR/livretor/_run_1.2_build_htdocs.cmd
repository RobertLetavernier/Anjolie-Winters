:: ----------------------------------------------------------- build source ----
::retrieve_htdocs
%svnExePath% export %remoteRoot%/%remoteFold%/dev %workingDir%\htdocs
rd /s /q %workingDir%\htdocs\.cache
rd /s /q %workingDir%\htdocs\.settings
REM rd /s /q %workingDir%\htdocs\tools
rd /s /q %workingDir%\htdocs\tools_goaland
rd /s /q %workingDir%\htdocs\patch
rd /s /q %workingDir%\htdocs\script
rd /s /q %workingDir%\htdocs\temp

copy NUL %workingDir%\scripts.txt
REM for %%I IN (%workingDir%\htdocs\cron\*) do (
    REM echo %%~nI%%~xI >> %workingDir%\scripts.txt
REM )

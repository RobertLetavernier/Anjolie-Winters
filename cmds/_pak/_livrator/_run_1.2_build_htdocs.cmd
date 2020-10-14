IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ----------------------------------------------------------- build source ----
::retrieve_htdocs
%svnExePath% export %sourceRoot%/dev %workingDir%\src
set "svnVers=%svnExePath% info --show-item revision %sourceRoot%/dev"

::remove_svnprojectfiles
rd /s /q %workingDir%\src\.cache
rd /s /q %workingDir%\src\.settings
del      %workingDir%\src\.buildpath
del      %workingDir%\src\.project

::clean_media
rd /s /q %workingDir%\src\media\alpia
rd /s /q %workingDir%\src\media\arsia
rd /s /q %workingDir%\src\media\arsia_pdp
rd /s /q %workingDir%\src\media\blog
rd /s /q %workingDir%\src\media\blogarticle
rd /s /q %workingDir%\src\media\blogauthor
rd /s /q %workingDir%\src\media\client
rd /s /q %workingDir%\src\media\client_case_study
rd /s /q %workingDir%\src\media\company
rd /s /q %workingDir%\src\media\contact
rd /s /q %workingDir%\src\media\customer
rd /s /q %workingDir%\src\media\gallery
rd /s /q %workingDir%\src\media\home
rd /s /q %workingDir%\src\media\images
rd /s /q %workingDir%\src\media\insight
rd /s /q %workingDir%\src\media\partner
REM rd /s /q %workingDir%\src\media\secure_download
rd /s /q %workingDir%\src\media\service
rd /s /q %workingDir%\src\media\social
rd /s /q %workingDir%\src\media\uploads
rd /s /q %workingDir%\src\media\user











REM rd /s /q %workingDir%\src\tools_goaland
REM rd /s /q %workingDir%\src\patch
REM rd /s /q %workingDir%\src\script
REM rd /s /q %workingDir%\src\temp

REM copy NUL %workingDir%\scripts.txt
REM for %%I IN (%workingDir%\src\cron\*) do (
    REM echo %%~nI%%~xI >> %workingDir%\scripts.txt
REM )

:: -------------------------------------------------------------- build sql ----
::retrieve_sql
%svnExePath% export --depth=immediates %remoteRoot%/%remoteFold%/deploy_template/sql/patch/ %workingDir%\sql_temp
mkdir %workingDir%\sql
set hasPatch=false
copy NUL %workingDir%\patchs.txt
for %%I IN (%workingDir%\sql_temp\%next3pVersPatch%*) do (
    copy %%I %workingDir%\sql\%%~nI%%~xI
    echo %%~nI%%~xI >> %workingDir%\patchs.txt
    set hasPatch=true
)
if [%hasPatch%]==[false] rd /s /q %workingDir%\sql
rd /s /q %workingDir%\sql_temp

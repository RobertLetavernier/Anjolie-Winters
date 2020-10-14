IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ----------------------------------------------------- update vers number ----
::retrieve_sql
FOR /F "tokens=* USEBACKQ" %%F IN (`%svnExePath% info --show-item revision %sourceRoot%/dev`) DO (
SET svnVers=%%F
)

set search=.000
set rplace=.%svnVers%

%rxrExePath% -f %workingDir%\src\conf\_version.inc.php -a -s %search% -r %rplace% -e utf8 --nobackup
:: ----------------------------------------------------------- Maj Version ----

mkdir %workingDir%\svn_checkout
cd /d %workingDir%\svn_checkout
%svnExePath% checkout %sourceRoot%/%remoteFold%/dev/conf/ %workingDir%\svn_checkout --depth empty
%svnExePath% up _version.inc.php

set /A vNex=%vPak%+1
set "search=%vMaj%.%vMin%.%vPak%"
set "rplace=%vMaj%.%vMin%.%vNex%"

echo %search%
echo %rplace%

"%rxrExePath%" -f %workingDir%\svn_checkout\_version.inc.php -a -s %search% -r %rplace% -e utf8 --nobackup --no-bom
%svnExePath% commit -m "[maj] version %rplace%" _version.inc.php

echo end
pause

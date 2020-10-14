IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
:: ----------------------------------------------------------- DEPENDENCIES ----
set svnExePath=C:\Programz\SlikSvn_1.8.9\bin\svn.exe
set zipExePath=C:\Programz\7-Zip\7z.exe
set rxrExePath=C:\Programz\rxrepl.exe
set scpExePath=C:\Programz\putty\WinSCP.com /ini=nul 
set minifyPath=C:\Programz\apache24_php71_x64\php_7.1.10\php.exe C:\Programz\minify\launcher.php
IF "%1"=="" CALL clickhandler.cmd %~nx0 & exit
echo %~0
:: ----------------------------------------------------------- build source ----
::retrieve_htdocs
set copysrc=%pakrootDir%\..\_sample
set copytgt=%workingDir%\src
mkdir %copytgt%
echo copy from %copysrc%
echo        to %copytgt%
xcopy /E  %copysrc%\* %copytgt%

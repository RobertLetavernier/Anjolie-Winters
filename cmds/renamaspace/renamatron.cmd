@echo off
TITLE Renamatron
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: config ::
set source=_sources.txt
set myroot=%~dp0
set wdrepo=%myroot%wd
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: build appender ::
SETLOCAL EnableDelayedExpansion
set "line=pandaligator"
FOR /F "delims=" %%G IN (%source%) do (
 set line=%%G
 :: Explode on separator "#"
 set "part2=!line:*#=!"
 for /F "tokens=1 delims=#" %%F IN ("!line!") do set "part1=%%F"
 :: Trim spaces
 REM set part1=!part1:~0,-1!
 REM set part2=!part2:~1!
 REM set part2=!part2: =!
 :: move
  if not [part2] == [] (
  echo !part2!
  REM echo move "%wdrepo%\!part1!" "%wdrepo%\!part2!"
  REM pause
  move "%wdrepo%\!part1!" "%wdrepo%\!part2!"
 )
)
echo  this is the end
pause
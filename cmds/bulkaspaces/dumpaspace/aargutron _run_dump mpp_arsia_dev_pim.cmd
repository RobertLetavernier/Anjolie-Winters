@echo off
Setlocal EnableDelayedExpansion
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set "callee="
set i=0
FOR %%F IN (%~n0) do (
   set /A i+=1
   if "!i!" NEQ "1" (
		set "callee=!callee! %%F"
	)
)
start %callee%
exit
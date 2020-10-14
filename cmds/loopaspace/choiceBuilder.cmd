@echo off

echo param 1 : %1
echo param 2 : %2

FORFILES /S /M choice_* /C "cmd /c echo @file"

pause


setlocal ENABLEDELAYEDEXPANSION

>  _subchoice.cmd echo @echo off
set key=0
set keyopt=
FOR /F %%p IN (%1) DO ( 
	
	set /A "key+=1"
	set keyopt=!keyopt!!key!
	>> _subchoice.cmd echo echo !key! : %%p
)

>> _subchoice.cmd echo CHOICE /C %keyopt% 

FOR /F %%p IN (%1) DO ( 
	
	>> _subchoice.cmd echo IF errorlevel !key! goto choice_!key!
	set /A "key-=1"
)

>> _subchoice.cmd echo goto choice_error

FOR /F %%p IN (%1) DO ( 
	
	set /A "key+=1"
	>> _subchoice.cmd echo :choice_!key!
	>> _subchoice.cmd echo ^>^> _out.txt echo %%p
	>> _subchoice.cmd echo goto choice_done
)

>> _subchoice.cmd echo :choice_error
>> _subchoice.cmd echo echo error
>> _subchoice.cmd echo goto choice_done
>> _subchoice.cmd echo :choice_done
>> _subchoice.cmd echo echo choice_done 

CALL _subchoice

endlocal
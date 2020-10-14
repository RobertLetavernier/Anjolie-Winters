call _conf.cmd

cls

set "SourceFile=Doc install.txt"
set DestFile=DocInstall.txt


DEL %DestFile%
copy "%SourceFile%" %DestFile%

rxrepl -f %DestFile% -a -s %%date%% -r %today% -e utf8 --nobackup
rxrepl -f %DestFile% -a -s %%logiciel%% -r %logiciel% -e utf8 --nobackup
rxrepl -f %DestFile% -a -s %%type%% -r %type% -e utf8 --nobackup
rxrepl -f %DestFile% -a -s %%svnBranchKey%% -r %svnBranchKey% -e utf8 --nobackup
rxrepl -f %DestFile% -a -s %%vMaj%% -r %vMaj% -e utf8 --nobackup
rxrepl -f %DestFile% -a -s %%vMin%% -r %vMin% -e utf8 --nobackup

if %type% == partial rxrepl -f %DestFile% -a -s "\r\n(@b|@c).*" -r "" -e utf8 --nobackup
if %type% == \r\n@c.* rxrepl -f %DestFile% -a -s "\r\n@c.*" -r "" -e utf8 --nobackup

rxrepl -f %DestFile% -a -s "(@a|@b|@c)" -r "" -e utf8 --nobackup

move "%DestFile%" "../%SourceFile%"
ENDLOCAL
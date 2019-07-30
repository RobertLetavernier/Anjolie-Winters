@echo OFF

set chrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
set output=%~d0
set output=%output%%~p0
set output=%output%%1.png
REM echo output : %output%

set source=http://localhost/Anjolie-Winters/flatplan.php?id=%1
REM echo source : %source%
%chrome% --headless --disable-gpu --screenshot=%output%  --window-size=941,1541 %source%

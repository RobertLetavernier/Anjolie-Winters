@echo OFF
echo start

set chrome="C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
set output=%~d0
set output=%output%%~p0
set output=%output%%1.pdf
echo output : %output%

REM set source=http://localhost/Anjolie-Winters/flatplan.php?id=%1
REM echo source : %source%

REM echo %chrome% --headless --disable-gpu --print-to-pdf=%output% %source%
%chrome% --headless --disable-gpu --print-to-pdf=%output% %source%

echo end

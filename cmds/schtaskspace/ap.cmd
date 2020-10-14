@echo off
echo Schtasking %~1
>> D:\www\scripts\cmd\schtaskspace\_schtasks_report.txt echo Schtasking %~1
echo s_chtasks /create /xml "D:\www\scripts\cmd\schtaskspace\instance1\%~1" /tn "arsia\instance1\%~n1" /ru user /rp pass

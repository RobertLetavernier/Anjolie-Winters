@echo off
REM SETLOCAL EnableDelayedExpansion
 set rename=%1
 IF "%rename:~0,2%"=="__" (
  rename %1 %rename:~1%
 ) ELSE (
  rename %1 _%rename%
 )
@echo off
title Scan subversions
:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
call "D:\www\scripts\cmd\_config_getDate.cmd" %0
set svnExePath=C:\Programz\SlikSvn_1.8.9\bin\svn.exe
set svnCommand=log -v --incremental --search ngaudefroy --search-and %1
REM set svnCommand=log -v -r {%_isoday%}:HEAD --search ngaudefroy
set sourceRoot=https://amsterdam.goaland.com/svn/


%svnExePath% %svnCommand% %sourceRoot%businessmanager/
%svnExePath% %svnCommand% %sourceRoot%goaland_siteweb/
%svnExePath% %svnCommand% %sourceRoot%lifechecker/    
%svnExePath% %svnCommand% %sourceRoot%sygesp_2010/    
%svnExePath% %svnCommand% %sourceRoot%datamanager_pim/
%svnExePath% %svnCommand% %sourceRoot%IDS_Connector/  
REM %svnExePath% %svnCommand% %sourceRoot%rb_3d/          
%svnExePath% %svnCommand% %sourceRoot%rb_creafurn/    
%svnExePath% %svnCommand% %sourceRoot%rb_etiquette/   
%svnExePath% %svnCommand% %sourceRoot%rb_intranet/    
%svnExePath% %svnCommand% %sourceRoot%rb_mediatheque/ 
%svnExePath% %svnCommand% %sourceRoot%rb_siteweb/     
%svnExePath% %svnCommand% %sourceRoot%rb_stat/        

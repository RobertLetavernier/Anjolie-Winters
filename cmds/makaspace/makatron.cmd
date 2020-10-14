@echo off
SETLOCAL EnableDelayedExpansion

:: Selection branche
set brancheid=%2
IF DEFINED brancheid goto VALIDATION_BRANCHE
:SELECTION_BRANCHE
set count=1
forfiles /m *.opt /c (
	echo !count! @fname
	set /a count+=1
)

pause

set /P brancheid=quelle branche
Mon choix : 

:VALIDATION_BRANCHE
set "no_branche=non defini"
set branche=%no_branche%

IF %brancheid% EQU 1 (
	set "client=standard_3.1.0 (php 7.1+)"
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 2 (
	set "client=standard_3.1.0 (php 7.0-)"
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=56
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 3 (
	set client=Allibert
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 4 (
	set client=Altavia
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 5 (
	set client=CCAS - 3.1.1
	set branche=3.1/ccas_3.1.1
	set ioncubeVersion=56
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 6 (
	set client=Eurocoustic
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 7 (
	set client=Gun Odalys / USY
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 8 (
	set client=Havas : Carrefourmarket
	set branche=3.1/carrefour_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 10 (
	set client=Havas : HPS / DCNS / Citroen
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=false
)
IF %brancheid% EQU 11 (
	set client=Tag / Dentsu
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=56
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=false
)
IF %brancheid% EQU 12 (
	set client=Yves Rocher
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=false
	set custom_ant_params=!custom_ant_params! -Dyvesrocher.enabled=true
	set custom_ant_params=!custom_ant_params! -Dyvesrocher.svn.source.url="https://lisbonne/svn/datamanager_yvesrocher/arsia_alpia/3.1/_standard_3.1.0"
	set custom_ant_params=!custom_ant_params! -Dyvesrocher.svn.revision=HEAD	
)
IF %brancheid% EQU 13 (
	set "client=standard_3.1.5 (php 7.0-)"
	set branche=3.1/_standard_3.1.5
	set ioncubeVersion=56
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 14 (
	set client=Cantillana
	set branche=3.1/_standard_3.1.0
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 15 (
	set "client=standard_3.1.5 (php 7.1+)"
	set branche=3.1/_standard_3.1.5
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)
IF %brancheid% EQU 16 (
	set "client=carrefour_3.1.1_lot1 (php 7.1+)"
	set branche=3.1/carrefour_3.1.1_lot1
	set ioncubeVersion=71
	set custom_ant_params=!custom_ant_params! -Dsygesp.enabled=true
	set custom_ant_params=!custom_ant_params! -Dpimdm.enabled=true
)

IF "%branche%" EQU "%no_branche%" (
	echo "branche non valide"
	goto SELECTION_BRANCHE
)



set custom_ant_params=%custom_ant_params% -Dcustomer.branche=%branche%
set custom_ant_params=%custom_ant_params% -Dioncube.encoding.version=%ioncubeVersion%
set custom_ant_params=%custom_ant_params% -Dioncube.encoding.passphrase=%ioncubePassPhrase%

echo prevenir  [%dest%]
echo client    [%client%]
echo branche   [%branche%]
echo builder   [%ioncubeVersion%]

REM echo ant param :
REM echo %custom_ant_params%
REM pause
timeout 5

::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: update sources and check if standard branch is merged
:: TODO :  add js / css compilation + autocommit
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

%svn_command% cleanup ..\deploy_template
%svn_command% cleanup ..\dev
%svn_command% cleanup ..\pimdatamanager
%svn_command% cleanup ..\pimdatamanager_deploy_template
rem %svn_command% cleanup ..\resources
rem	%svn_command% cleanup ..\yvesrocher

set mergeinfosize=0

echo mise a jour des sources ...

:: update sources first
call ant -d svn.update %custom_ant_params%>%folder%ant.log

timeout 2

cd C:\goaland\arsia_3.1\make
:: verifie qu il n y a rien a merger depuis la branche standard (standard precedente pour la branche standard)
set arsia_version_checked=[]
set pim_version_checked=[]

IF %branche%==%arsia_standard_branch% (
	set arsia_version_checked=%arsia_standard_branch_ancestor%
	set pim_version_checked=%pim_standard_branch_ancestor%
) ELSE (
	set arsia_version_checked=%arsia_standard_branch%
	set pim_version_checked=%pim_standard_branch%
)

echo verification que la branche %arsia_version_checked% est merge ..

>mergeinfos.txt svn mergeinfo --show-revs eligible %arsia_svn_url%%arsia_version_checked%/dev %arsia_svn_url%%branche%/dev
>>mergeinfos.txt svn mergeinfo --show-revs eligible %pim_svn_url%%pim_version_checked%/dev %pim_svn_url%%branche%/dev
>>mergeinfos.txt svn mergeinfo --show-revs eligible %arsia_svn_url%%arsia_version_checked%/deploy_template %arsia_svn_url%%branche%/deploy_template
>>mergeinfos.txt svn mergeinfo --show-revs eligible %pim_svn_url%%pim_version_checked%/deploy_template %pim_svn_url%%branche%/deploy_template

for /f %%I in ("mergeinfos.txt") do set mergeinfosize=%%~zI
del mergeinfos.txt

timeout 2

:: cls
IF %mergeinfosize% GTR 0 (
	echo ------------------------------------------------------------------
	echo ! La branche %arsia_version_checked% n a pas ete merge !
	echo ------------------------------------------------------------------

	php -d SMTP=smtp.free.fr -d smtp_port=25 -r "mail('%dest%', 'Warn - Merge manquant', 'Attention! la compilation est en cours, mais %arsia_version_checked% n est pas merge dans %branche% - ', 'From: autobuild@goaland.com');
)

echo Le build commence
echo Un email sera envoye a %dest% a la fin de l operation

del %folder%ant.log


:: LANCEMENT DU BUILD
:: REM si call n'est pas utilisé, le script s'arrete après la commande ant
cd %folder%
call ant -d build.crypt %custom_ant_params%>%folder%ant.log
echo Fin du build

timeout 5

:: envoi d un email
php -d SMTP=smtp.free.fr -d smtp_port=25 -r "mail('%dest%', 'Les sources de %branche% sont pretes', 'Les sources de %branche% sont pretes.' . PHP_EOL . 'Les sources sont disponibles dans \\VMFRONT\build_31\builded', 'From: autobuild@goaland.com');

echo mail envoye

::ouvre le dossier builded
start %folder%..\build\builded\

:: Copie des sources dans le package d'installation sur nas2
REM IF %branche%==%arsia_standard_branch% (
REM set /P copy_nas2=Faut-il copier les sources dans le package d installation (sur NAS2) O/N ?

REM IF %copy_nas2%==O(
REM copy %folder%..\build\builded\source\sygesp \\192.168.0.27\sygesp\package_install\3.1.0\to_copy_web\htdocs
REM )

pause

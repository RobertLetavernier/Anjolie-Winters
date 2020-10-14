:: ---------------------------------------------------- Copy to package dir ----
REM mkdir %packageDir%\%remoteFold%
set packageDir=%packageDir%\%remoteFold%
start %packageDir%
copy %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf %packageDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf
copy %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf %packageDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.docx
copy %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.zip %packageDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.zip
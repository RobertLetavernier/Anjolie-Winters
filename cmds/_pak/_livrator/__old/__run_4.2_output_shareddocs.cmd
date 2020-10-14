:: ---------------------------------------------------- Copy to package dir ----
REM mkdir %packageDir%\%remoteFold%
mkdir %sharedDocs%\%remoteFold%\%prev3pVers%_vers_%next3pVers%
set sharedDocs=%sharedDocs%\%remoteFold%\%prev3pVers%_vers_%next3pVers%

copy %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.docx %sharedDocs%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.docx
copy %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf %sharedDocs%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.pdf
start %sharedDocs%

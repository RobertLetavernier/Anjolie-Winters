:: ---------------------------------------------------- build documentation ----
::build_doc
copy %samplePath% %workingDir%\sample.docx

%zipExePath% x %workingDir%\sample.docx -o%workingDir%\x_sample
del %workingDir%\sample.docx
::Replace head
%rxrExePath% -f %workingDir%\x_sample\word\header1.xml -a -s __prev__ -r %prev3pVers% -e utf8 --nobackup
%rxrExePath% -f %workingDir%\x_sample\word\header1.xml -a -s __curr__ -r %next3pVers% -e utf8 --nobackup
::Replace document
%rxrExePath% -f %workingDir%\x_sample\word\document.xml -a -s __prev__ -r %prev3pVers% -e utf8 --nobackup
%rxrExePath% -f %workingDir%\x_sample\word\document.xml -a -s __curr__ -r %next3pVers% -e utf8 --nobackup
%rxrExePath% -f %workingDir%\x_sample\word\document.xml -a -s __date__ -r %dateFraStr% -e utf8 --nobackup
%zipExePath% a %workingDir%\doc.docx %workingDir%\x_sample\*

copy %workingDir%\doc.docx %workingDir%\Easy3p_maj_%prev3pVers%_vers_%next3pVers%.docx

copy NUL %workingDir%\Easy3p_%next3pVers%.info
echo merge: %prev3pVers% >> %workingDir%\Easy3p_%next3pVers%.info
echo content: Corrections __ANOMALIES__ >> %workingDir%\Easy3p_%next3pVers%.info
echo date: %_isodate% >> %workingDir%\Easy3p_%next3pVers%.info

rd /s /q %workingDir%\x_sample
del %workingDir%\doc.docx

start %workingDir%

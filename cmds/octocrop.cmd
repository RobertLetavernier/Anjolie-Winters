@echo off
title Octocrop

set    nconvert=C:\Programz\nconvert\nconvert.exe

%nconvert%          -o   1.jpg -crop    0 0 210 297 full.jpg
%nconvert%          -o   2.jpg -crop  210 0 210 297 full.jpg
%nconvert%          -o   3.jpg -crop  420 0 210 297 full.jpg
%nconvert%          -o   4.jpg -crop  630 0 210 297 full.jpg
%nconvert%          -o   5.jpg -crop  840 0 210 297 full.jpg
%nconvert%          -o   6.jpg -crop 1050 0 210 297 full.jpg
%nconvert%          -o   7.jpg -crop 1260 0 210 297 full.jpg
%nconvert%          -o   8.jpg -crop 1470 0 210 297 full.jpg

%nconvert% -out pdf -o   1.pdf -crop    0 0 210 297 full.jpg
%nconvert% -out pdf -o   2.pdf -crop  210 0 210 297 full.jpg
%nconvert% -out pdf -o   3.pdf -crop  420 0 210 297 full.jpg
%nconvert% -out pdf -o   4.pdf -crop  630 0 210 297 full.jpg
%nconvert% -out pdf -o   5.pdf -crop  840 0 210 297 full.jpg
%nconvert% -out pdf -o   6.pdf -crop 1050 0 210 297 full.jpg
%nconvert% -out pdf -o   7.pdf -crop 1260 0 210 297 full.jpg
%nconvert% -out pdf -o   8.pdf -crop 1470 0 210 297 full.jpg

%nconvert% -out pdf -o 2-3.pdf -crop  210 0 420 297 full.jpg
%nconvert% -out pdf -o 4-5.pdf -crop  630 0 420 297 full.jpg
%nconvert% -out pdf -o 6-7.pdf -crop 1050 0 420 297 full.jpg


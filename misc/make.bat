@echo off
set path=C:\Program Files (x86)\MiKTeX 2.9\miktex\bin\
set pdflatex=pdflatex.exe
set bibtex=bibtex
IF NOT EXIST "%path%" (
set path="C:\Program Files\MiKTeX 2.9\miktex\bin\"
)
echo %path%
"%path%%pdflatex%" -shell-escape vorlage
"%path%%bibtex%" vorlage
"%path%%pdflatex%" -shell-escape vorlage
"%path%%pdflatex%" -shell-escape vorlage

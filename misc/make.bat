@echo off
setlocal EnableDelayedExpansion

REM set some variables
set "filename=vorlage"
set "pdflatex=pdflatex"
set "bibtex=bibtex"
REM add MikTeX path to PATH in case it's not in there yet:
set "PATH=C:\Program Files (x86)\MiKTeX 2.9\miktex\bin;!PATH!"
where "!pdflatex!"
if errorlevel 1 exit /B !errorlevel!
REM prevent pdflatex from wrapping output lines as per https://tex.stackexchange.com/a/52994 (unless the user specified some values explicitly themselves)
if not defined max_print_line set "max_print_line=100000"
if not defined error_line set "error_line=254"
if not defined half_error_line set "half_error_line=238"

REM switch to base directory (must later switch back with popd!)
pushd "%~dp0\.."
"!pdflatex!" -halt-on-error -interaction=errorstopmode -shell-escape -output-directory=output "!filename!"
if errorlevel 1 popd & exit /B %errorlevel%
"!bibtex!" -output-directory=output -include-directory=output "!filename!"
if errorlevel 1 popd & exit /B %errorlevel%
REM re-run pdflatex twice more to update references (page numbers can take a while to settle down)
"!pdflatex!" -halt-on-error -interaction=errorstopmode -shell-escape -output-directory=output "!filename!"
if errorlevel 1 popd & exit /B %errorlevel%
REM last run also creates synctex data in case you open this with an IDE
"!pdflatex!" -halt-on-error -interaction=errorstopmode -shell-escape -output-directory=output -synctex=1 "!filename!"
if errorlevel 1 popd & exit /B %errorlevel%
popd & exit /B 0

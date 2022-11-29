@echo off
setlocal EnableDelayedExpansion

REM set some variables
set "filename=vorlage"
set "pdflatex=pdflatex"
set "biber=biber"
set "makeglossaries=makeglossaries"
REM add MikTeX path to PATH in case it's not in there yet:
set "PATH=C:\Program Files (x86)\MiKTeX 2.9\miktex\bin;!PATH!"
where "!pdflatex!"
if errorlevel 1 exit /B !errorlevel!
REM prevent pdflatex from wrapping output lines as per https://tex.stackexchange.com/a/52994 (unless the user specified some values explicitly themselves)
if not defined max_print_line set "max_print_line=100000"
if not defined error_line set "error_line=254"
if not defined half_error_line set "half_error_line=238"

REM switch to base directory (must later switch back with popd!)
"!pdflatex!" -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory="%~dp0\..\output" "%~dp0\..\!filename!"
if errorlevel 1 echo Error: first pdflatex step failes. >&2 & exit /B %errorlevel%
"!biber!" "%~dp0\..\output\!filename!"
if errorlevel 1 echo Error: biber step failes. >&2 & exit /B %errorlevel%
"!makeglossaries!" -d "%~dp0\..\output" "!filename!"
if errorlevel 1 echo Error: makeglossaries step failes. >&2 & exit /B %errorlevel%
REM re-run pdflatex twice more to update references (page numbers can take a while to settle down)
"!pdflatex!" -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory="%~dp0\..\output" "%~dp0\..\!filename!"
if errorlevel 1 echo Error: second pdflatex step failes. >&2 & exit /B %errorlevel%
REM last run also creates synctex data in case you open this with an IDE
"!pdflatex!" -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory="%~dp0\..\output" "%~dp0\..\!filename!"
if errorlevel 1 echo Error: third pdflatex step failes. >&2 & exit /B %errorlevel%
exit /B 0

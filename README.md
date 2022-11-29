# AKAD LaTeX Vorlage für eine wissenschaftliche Arbeit

Diese LaTeX Vorlage entspricht den Richtlinien der AKAD University zur Erstellung wissenschaftlicher Arbeiten. Sie basiert auf einem Fork der akad-vorlage von tammon, überprüft auf Aktualität der Richtlinien, angepasst an einen Workflow mit Visual Studio Code und TeX Live, und Warnungen Behoben.

## Dateien
(Diese Sektion war schon im ursprünglichen Fork veraltet und wurde noch nicht aktualisiert.)
	vorlage.tex
		Einstiegspunkt für latex compiler
	einstellungen.tex
		Einstellungen
		- Benutzer
		- Anzeige der jeweiligen Verzeichnisse
	content/einleitung.tex 
		Einleitung
	content/grundlagen.tex
		Grundlagen
	content/hauptteil.tex
		Hauptteil
	content/schluss.tex
		Schluss
	content/abkuerzungen.tex
		Abkürzungverzeichnis und Glossar (glossaries)
	literatur.bib
		Literatur in BibTex Syntax. 
		- Zitatsgenerator http://www.literatur-generator.de/
	preamble/commands.tex
		Eigene Kommandos
	resources/
		Platz für Bilder, PDFs, Bücher und andere Ressourcen
	output/
		Zielordner für Output, sowohl Zwischenkompilate als auch fertiges PDF

## LaTeX Dokument erstellen
### Grundlagen
Egal durch welchen Mechanismus, es wird grundsätzlich folgendes ausgeführt:
```
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage
	biber output/vorlage
	makeglossaries -d output vorlage
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage
```

### Codespaces
Mit GitHub Codespace kann ein PDF direkt in der Cloud erzeugt werden, ohne lokal irgendetwas installieren zu müssen!  
1. Auf GitHub über den "<> Code" button einen Codespace öffnen (texlive und LaTeX Workshop sind bereits installiert und konfiguriert)
1. In der resultierenden Web-IDE ein beliebiges tex file öffnen (z.B. vorlage.tex)
1. Oben rechts erscheinen ein grüner Pfeil zum Erzeugen des PDFs und ein Preview-button zum Anzeigen des PDFs (aktualisiert automatisch)

### Windows Batch
Im Ordner misc liegt ein File namens make.bat, dieses kann ausgeführt werden um das PDF manuell zu erzeugen (vorausgesetzt pdflatex ist im PATH).
### Linux/MacOS makefile
Hierfür gibt es ein Makefile im Ordner misc.

### IDE
Es gibt viele IDEs für LaTeX. Der aktuelle Fork existiert hauptsächlich, weil ich Visual Studio Code verwenden wollte mit der Extension "LaTeX Workshop" und der LaTeX Installation TeX Live.  
In diesem Fall sollte in den Einstellungen der Extension der Wert "latex-workshop.latex.outDir" auf "%DIR%/output" gesetzt werden und dann mit latexmk (default) gebaut werden. Das PDF wird dann bei jedem Abspeichern erzeugt und der preview automatisch refreshed.

## Credits
Weiterentwicklung basierend auf [tammon/akad-vorlage](https://github.com/tammon/akad-vorlage), selbst eine Weiterentwicklung basierend auf [derdanu/akad-vorlage](https://github.com/derdanu/akad-vorlage).

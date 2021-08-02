# AKAD LaTeX Vorlage für eine wissenschaftliche Arbeit

Diese LaTeX Vorlage entspricht den Richtlinien der AKAD University zur Erstellung wissenschaftlicher Arbeiten. Sie basiert auf einem Fork der akad-vorlage von derdanu, weiterentwickelt und aufgehübscht weitestgehend basierend auf den KOMA Klassen und den aktuellen LaTeX best practices. Hierdurch wurden einige obsolete Pakete gegen aktuelle ausgetauscht. Die unten stehende README ist noch aus dem Fork und damit veraltet. Bei Gelegenheit werde ich diese noch einmal updaten. Die Prinzipien sind allerdings bzgl. der Aufgaben der einzel .tex Dateien nahezu identisch geblieben.

## Dateien

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
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage
	biber output/vorlage
	makeglossaries -d output vorlage
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage
	pdflatex -halt-on-error -interaction=errorstopmode -shell-escape -synctex=1 -output-directory=output vorlage

## Credits
Weiterentwicklung basierend auf [derdanu/akad-vorlage](https://github.com/derdanu/akad-vorlage)

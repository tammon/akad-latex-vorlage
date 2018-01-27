# AKAD Latex Vorlage für eine wissenschaftl. Arbeit

Diese LaTeX Vorlage entspricht den Richtlinien der AKAD University zur Erstellung wissenschaftlicher Arbeiten. Sie basiert auf einem Fork der akad-vorlage von derdanu, weiterentwickelt und aufgehübscht weitestgehend basierend auf den KOMA Klassen und den aktuellen LaTeX best practices. Hierdurch wurden einige obsolete Pakete gegen aktuelle ausgetauscht. Die unten stehende README ist noch aus dem Fork und damit veraltet. Bei Gelegenheit werde ich diese noch einmal updaten. Die Prinzipien sind allerdings bzgl. der Aufgaben der einzel .tex Dateien nahezu identisch geblieben.

Dateien

	content/einleitung.tex 
		Einleitung
	content/grundlagen.tex
		Grundlagen
	content/hauptteil.tex
		Hauptteil
	content/schluss.tex
		Schluss
	literatur.bib
		Literatur in BibTex Syntax. 
		- Zitatsgenerator http://www.literatur-generator.de/
	content/abkuerzungen.tex
		Abkürzungverzeichnis und Glossar (glossaries)
	einstellungen.tex
		Einstellungen
		- Benutzer
		- Anzeige der jeweiligen Verzeichnisse
	preamble/commands.tex
		Eigene Kommandos
	resources/
		Platz für Bilder, PDFs, Bücher und andere Ressourcen

Zum Erstellen folgende Latex Kommandos ausführen:

	pdflatex --shell-escape vorlage
	biber vorlage
	glossaries vorlage
	pdflatex --shell-escape vorlage
	pdflatex --shell-escape vorlage

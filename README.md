# AKAD Latex Vorlage für eine wissenschaftl. Arbeit

Diese LaTeX Vorlage entspricht den Richtlinien der AKAD University zur Erstellung wissenschaftlicher Arbeiten. Sie basiert auf einem Fork der akad-vorlage von derdanu, weiterentwickelt und aufgehübscht weitestgehend basierend auf den KOMA Klassen und den aktuellen LaTeX best practices. Hierdurch wurden einige obsolete Pakete gegen aktuelle ausgetauscht. Die unten stehende README ist noch aus dem Fork und damit veraltet. Bei Gelegenheit werde ich diese noch einmal updaten. Die Prinzipien sind allerdings bzgl. der Aufgaben der einzel .tex Dateien nahezu identisch geblieben.


## ACHTUNG: Doku ist noch veraltet!

Dateien

	einleitung.tex 
		Einleitung
	grundlagen.tex
		Grundlagen
	hauptteil.tex
		Hauptteil
	schluss.tex
		Schluss
	literatur.bib
		Literatur in BibTex Syntax. 
		- Zitatsgenerator http://www.literatur-generator.de/
	abkuerzungen.tex
		Abkürzungverzeichniss
	einstellungen.tex
		Einstellungen
		- Benutzer
		- Anzeige der jeweiligen Verzeichnisse
	commands.tex
		Eigene Kommandos

Zum Erstellen folgende Latex Kommandos ausführen:

	pdflatex --shell-escape vorlage
	biber vorlage
	pdflatex --shell-escape vorlage
	pdflatex --shell-escape vorlage



## Windows
-------

* Latex Umgebung http://miktex.org/download
* make.bat ausführen

* Bei aktuellen Problemen, dass Latex Packete nicht gefunden werden im MiKTeX Verzeichniss unter bin die Datei miktex-update_admin.exe ausführen

## Linux
-----

Es reicht eine einfaches "make" zum Erstellen der PDF. 

"make view" erstellt und zeigt diese auch sofort an.

* Benötigte Packete bei einem Debian System installieren
  * aptitude install make git texlive texlive-lang-german texlive-latex-extra bibtex python-pygments


## Mac OS X 
--------

Es reicht eine einfaches "make" zum Erstellen der PDF. 

"make view" erstellt und zeigt diese auch sofort an.

* Benötigte Packete
  * Um make nutzen zu können müssen die XCode Developer Commandline Tools installiert sein. https://developer.apple.com/xcode/
  * Latex Umgebung http://www.tug.org/mactex/
  * Pygments - Installation mit "sudo easy_install Pygments"

filename = vorlage

neededfiles = abkuerzungen.tex einleitung.tex einstellungen.tex grundlagen.tex hauptteil.tex schluss.tex literatur.bib


UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Linux)
	pdflatexcmd = pdflatex --shell-escape
	bibtexcmd = bibtex
	pdfviewercmd = atril
endif

ifeq ($(UNAME_S), Darwin)
	pdflatexcmd = /usr/texbin/pdflatex --shell-escape
	bibtexcmd = /usr/texbin/bibtex
	pdfviewercmd = open
endif


all: $(filename).tex $(neededfiles) latex clean
latex:
	$(pdflatexcmd) -halt-on-error -interaction=errorstopmode -shell-escape -output-directory=output $(filename)
	$(bibtexcmd) -output-directory=output -include-directory=output $(filename)
	# re-run pdflatex twice more to update references (page numbers can take a while to settle down)
	$(pdflatexcmd) -halt-on-error -interaction=errorstopmode -shell-escape -output-directory=output $(filename)
	# last run also creates synctex data in case you open this with an IDE
	$(pdflatexcmd) -halt-on-error -interaction=errorstopmode -synctex=1 -shell-escape -output-directory=output $(filename)

view:
	if [ -f "output/$(filename).pdf" ]; then \
		$(pdfviewercmd) "output/$(filename).pdf"; \
	else \
		$(MAKE) all ;\
		$(MAKE) view ;\
	fi
clean:
	git clean -fx
distclean:
	git checkout -f master
	$(MAKE) clean

filename = vorlage

neededfiles = abkuerzungen.tex einleitung.tex einstellungen.tex grundlagen.tex hauptteil.tex schluss.tex literatur.bib


UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S), Linux)
	pdflatexcmd = pdflatex --shell-escape
	bibercmd = biber
	makeglossariescmd = makeglossaries
	pdfviewercmd = atril
endif

ifeq ($(UNAME_S), Darwin)
	pdflatexcmd = /usr/texbin/pdflatex --shell-escape
	bibercmd = /usr/texbin/biber
	makeglossaries = /usr/texbin/makeglossaries
	pdfviewercmd = open
endif


all: $(filename).tex $(neededfiles) latex clean
latex:
	$(pdflatexcmd) -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory=output $(filename)
	$(bibercmd) output/$(filename)
	$(makeglossariescmd) -d output $(filename)
	# re-run pdflatex twice more to update references (page numbers can take a while to settle down)
	$(pdflatexcmd) -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory=output $(filename)
	# last run also creates synctex data in case you open this with an IDE
	$(pdflatexcmd) -halt-on-error -interaction=nonstopmode -shell-escape -synctex=1 -output-directory=output $(filename)

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

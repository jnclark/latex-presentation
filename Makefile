# Project-specific settings
#DOCNAME = presentation

all: handout presentation

.PHONY: clean
clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.nav *.snm *.vrb *.toc *.d *.fls *.fdb_latexmk *.dvi

handout: handout.tex body.tex
	latexmk -pdf -bibtex handout

presentation: presentation.tex body.tex
	latexmk -pdf -bibtex presentation

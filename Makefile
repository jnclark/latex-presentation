# Project-specific settings
DOCNAME = presentation

all: handout slides

.PHONY: clean
clean: 
	rm -f *.aux *.blg *.out *.bbl *.log *.nav *.snm *.vrb *.toc *.d *.fls *.fdb_latexmk *.dvi
  
handout: $(DOCNAME)_handout.tex $(DOCNAME).tex
	latexmk -pdf -bibtex $(DOCNAME)_handout
  
slides: $(DOCNAME)_slides.tex $(DOCNAME).tex
	latexmk -pdf -bibtex $(DOCNAME)_slides

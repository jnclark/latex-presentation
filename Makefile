all: handout presentation

.PHONY: clean
clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.nav *.snm *.vrb *.toc *.d *.fls *.fdb_latexmk *.dvi
	rm -rf build/
nuke: clean
	rm -f *.pdf

handout: handout.tex body.tex
	latexmk -pdf -bibtex handout
	cp build/handout.pdf handout.pdf

presentation: presentation.tex body.tex
	latexmk -pdf -bibtex presentation
	cp build/presentation.pdf presentation.pdf

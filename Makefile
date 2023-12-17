all: handout presentation

.PHONY: clean
clean:
	rm -f *.aux *.blg *.out *.bbl *.log *.nav *.snm *.vrb *.toc *.d *.fls *.fdb_latexmk *.dvi
	rm -rf build/
clean-pdf: clean
	rm -f *.pdf

handout: handout.tex body.tex
	latexmk -interaction=nonstopmode -pdf -bibtex -lualatex -outdir=build/ handout
	cp build/handout.pdf handout.pdf

presentation: presentation.tex body.tex
	latexmk -interaction=nonstopmode -pdf -bibtex -lualatex -outdir=build/ presentation
	cp build/presentation.pdf presentation.pdf

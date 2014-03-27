PROPOSAL=proposal

LATEX=pdflatex
BIBTEX=bibtex --min-crossrefs=1000

TEX = $(wildcard *.tex)
REF = $(wildcard *.bib)
STY = $(wildcard *.sty) $(wildcard *.cls)

all: $(PROPOSAL).pdf

$(PROPOSAL).pdf: $(TEX) $(REF) $(STY)
	$(LATEX) $(PROPOSAL)
	$(BIBTEX) $(PROPOSAL)
	$(LATEX) $(PROPOSAL)
	$(LATEX) $(PROPOSAL)

clean:
	$(RM) *.dvi *.aux *.log *.blg *.bbl *.out
	$(RM) *~

clean-all: clean
	$(RM) $(PROPOSAL).pdf

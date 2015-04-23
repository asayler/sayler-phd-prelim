PROPOSAL=prelim-proposal
REPORT=prelim-report

LATEX=pdflatex
BIBTEX=bibtex --min-crossrefs=1000

REF = $(wildcard *.bib)
STY = $(wildcard *.sty) $(wildcard *.cls)

all: $(REPORT).pdf $(PROPOSAL).pdf

$(PROPOSAL).pdf: $(PROPOSAL).tex $(REF) $(STY)
	$(LATEX) $(PROPOSAL)
	$(BIBTEX) $(PROPOSAL)
	$(LATEX) $(PROPOSAL)
	$(LATEX) $(PROPOSAL)

$(REPORT).pdf: $(REPORT).tex $(REF) $(STY)
	$(LATEX) $(REPORT)
	$(BIBTEX) $(REPORT)
	$(LATEX) $(REPORT)
	$(LATEX) $(REPORT)

clean:
	$(RM) *.dvi *.aux *.log *.blg *.bbl *.out
	$(RM) *~

clean-all: clean
	$(RM) $(PROPOSAL).pdf
	$(RM) $(REPORT).pdf

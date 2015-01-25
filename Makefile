ECESG.pdf: ECESG.tex $(patsubst %.fig, %.mps, $(wildcard *.fig)) soul-transfer.pdf
	pdflatex -interaction=batchmode ECESG && pdflatex -interaction=batchmode ECESG

%.mp: %.fig
	fig2dev -L mp $< > $@

%.mps: %.mp
	mpost $<
	mv $*.0 $@

clean:
	rm -f *.log *.toc *.aux *.dvi *.bak junk.dot *.out *.lo? ECESG.pdf *.mp*

.SUFFIXES: .c .o .ps .dvi .tex .eps .fig .pdf .dot .tiff .png .svg

all: edb.pdf

INKSCAPE = inkscape

slides.dvi: time.eps

.svg.eps:
	$(INKSCAPE) -f $< -E $@

.dot.eps:
	dot -Tps < $< > $@

.tex.dvi:
	latex $< ; latex $<

.dvi.ps:
	dvips -f -t landscape < $< > $@

.ps.pdf:
	ps2pdf $<

.fig.eps:
	fig2dev -Leps -c -p a $< $@

clean:: force
	rm -f *.dvi *.ps *~ *.aux *.log *.pdf *.bak *.out *.toc *.eps *.tiff

force:

main:all

all:main.tex
	xelatex main.tex

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.toc *.bcf *.xml *~

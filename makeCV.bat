pdflatex SolymosCV.tex
bibtex SolymosCV.aux
bibtex procpr.aux
bibtex inbook.aux
bibtex letterpr.aux
bibtex paperpr.aux
bibtex subm.aux
bibtex report.aux
R CMD BATCH --vanilla bbltricks.R
pdflatex SolymosCV.tex
pdflatex SolymosCV.tex
del *.aux
del *.out
del *.log
del *.bbl
del *.blg
del *.Rout

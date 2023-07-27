LATEXMK=latexmk
BASE=$(shell basename $(shell pwd))
VERSION=`git describe | sed s/\\\\./_/`
HASH=`git rev-parse --short HEAD`
BRANCH=`git rev-parse --abbrev-ref HEAD`
PDFTK=pdftk
PANDOC=pandoc -s
BUILDDIR=build
JOBNAME=${BUILDDIR}/${BASE}-${BRANCH}-${VERSION}-${HASH}
SUPPJOBNAME=${BUILDDIR}/${BASE}-supplement-${BRANCH}-${VERSION}-${HASH}
LWARP=lwarpmk
FIGDIR=figures
BIBFILE=refs.bib
FULL_BIBFILE=${HOME}/Documents/literature/refs.bib

.PHONY: deploy clean cleanall docx all

all:
	${LATEXMK}

refs:
	abbreviate-journals ${FULL_BIBFILE} -o ${BIBFILE} -L main.aux -L supplement.aux --force


clean:
	${LATEXMK} -c
	-${LWARP} clean
	-rm lwarp.* lwarp_.* lwarpmk.conf *.lwarpmkconf lwarp_*.txt
	find ${FIGDIR}/ -name "*.pdf" -exec sh -c "echo {} | sed -e 's/\(.*\).pdf/\1.svg/g' | xargs rm " \; # Delete temporary svg figures
	-rm -rf main-images/
	-rm -rf main-images.txt
	-rm -rf supplement-images/
	-rm -rf supplement-images.txt
	-rm *_html.tex
	-rm *.css *.cut
	find . -regex "./\(supplement\|main\)\(_html\)?.html" -exec rm {} \; # Temporary html files
	find . -regex "./\(supplement\|main\)\.texe" -exec rm {} \; # Temporary texe files
	find . -regex "./\(supplement\|main\)\_html.pdf" -exec rm {} \; # Temporary texe files

cleanall: clean
	${LATEXMK} -C
	-${LWARP} cleanall
	-rm ${JOBNAME}.odt
	-rm ${SUPPJOBNAME}.odt

deploy:
	${LATEXMK} -jobname=${JOBNAME} main.tex
	${LATEXMK} -jobname=${SUPPJOBNAME} supplement.tex
	${PDFTK} ${JOBNAME}.pdf ${FIGDIR}/*.pdf ${SUPPJOBNAME}.pdf cat output ${JOBNAME}-combined.pdf
	zip ${JOBNAME}.zip main.tex ${FIGDIR}/*.pdf ${FIGDIR}/*.png ${FIGDIR}/*.jpg ${FIGDIR}/*.tex refs.bib refs-extra.bib MSP.bst Makefile acronyms.tex macros.tex colors.tex acronyms.tex VCH-logo.png WileyMSP-template.cls main.bbl supplement.tex latexmkrc


odt: main.tex supplement.tex
	${LWARP} pdftosvg ${FIGDIR}/*.pdf
	${LATEXMK} # Make PDF files first
	${LWARP} html -p main
	${LWARP} limages -p main
	${PANDOC} -o ${JOBNAME}.odt -s main.html
	${LWARP} html -p supplement
	${LWARP} limages -p supplement
	${PANDOC} -o ${SUPPJOBNAME}.odt -s supplement.html

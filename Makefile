## Markdown extension (e.g. md, markdown, mdown).
MEXT = md
 
## All markdown files in the working directory, except README.md
SRC = $(filter-out README.md, $(wildcard *.$(MEXT)))
 
## Location of Pandoc support files.
PREFIX = %userprofile%\AppData\Roaming\pandoc
 
PDFS=$(SRC:.md=.pdf)
 
all:	$(PDFS) epub pdf
epub:	combined.epub
pdf:	$(PDFS) combined.pdf
  
folders:
	mkdir epub
	mkdir img
	mkdir md
	mkdir pdf

%.pdf:	%.md template.tex
	pandoc \
	--normalize \
	--smart \
	--template=template.tex \
	-o pdf/$@ $<
	
combined.pdf:	combined.md template.tex
	pandoc \
	--normalize \
	--smart \
	--chapters \
	--template=template.tex \
	-o pdf/combined.pdf \
	metadata.yaml md/combined.md
	
combined.epub:	combined.md metadata.yaml epub.css cover.jpg
	pandoc \
	--normalize \
	--smart \
	--template=template.epub \
	--epub-stylesheet=epub.css \
	--epub-chapter-level=1 \
	--epub-embed-font=fp9r8a.otf \
	--toc \
	--toc-depth=1 \
	-o epub/combined.epub \
	metadata.yaml md/combined.md

combined.md:	folders build.bat combined-template
	build.bat

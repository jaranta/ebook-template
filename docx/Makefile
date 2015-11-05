DOCXS=$(wildcard *.docx)
MD=$(MD:.docx=.md)
.SUFFIXES: .docx .md

default: $(MD)
  
.docx.md:
	pandoc \
	--normalize \
	--standalone \
	--no-wrap \
	--atx-headers \
	--base-header-level=2 \
	--id-prefix=$* \
	$< -o $@
	
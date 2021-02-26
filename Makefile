SOURCE := $(wildcard book/*.md)
DEST := $(SOURCE:.md=.pdf)

book: $(DEST)

book/%.pdf: book/%.md
	pandoc $< \
		--from markdown \
		--lua-filter book/include-files.lua \
		--lua-filter book/internal-links.lua \
		--lua-filter book/template-blocks.lua \
		--pdf-engine lualatex \
		--include-in-header book/preamble.tex \
		--file-scope --toc -o $@

clean:
	$(RM) book/*.pdf

.PHONY: book clean

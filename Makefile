.PHONY: book
book:
	pandoc book/*.md \
		--from markdown \
		--lua-filter book/include-files.lua \
		--lua-filter book/internal-links.lua \
		--lua-filter book/template-blocks.lua \
		--pdf-engine lualatex \
		--include-in-header book/preamble.tex \
		--file-scope --toc -o book/book.pdf

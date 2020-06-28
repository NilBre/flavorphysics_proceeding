all: build/new_proceedings.pdf

build/new_proceedings.pdf: FORCE | build
	  TEXINPUTS="$(call translate,build:)" \
	  BIBINPUTS=build: \
	  max_print_line=1048576 \
	latexmk \
	  --lualatex \
	  --output-directory=build \
	  --interaction=nonstopmode \
	  --halt-on-error \
	new_proceedings.tex

build:
	mkdir -p build

clean:
	rm -rf build

FORCE:

.PHONY: all clean

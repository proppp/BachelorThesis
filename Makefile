## package name
NAME := $(shell basename `pwd`)
MAIN := main
DATE := $(shell date +"%Y%m%d")
TEXFILES := $(shell find . -type f -iname '*.tex')

.PHONY: $(NAME).pdf

## targets:
all: $(MAIN).pdf

$(MAIN).pdf: $(TEXFILES)
	latexmk -pdf -pdflatex="pdflatex -interactive=nonstopmode" -use-make $(MAIN.tex)

clean:
	rm -rf .dist
	latexmk -C

dist: clean
	mkdir -p .dist/$(NAME)
	cp -r * .dist/$(NAME)
	tar -czvf $(NAME)-$(DATE).tar.gz -C .dist $(NAME)

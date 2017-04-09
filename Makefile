# Makefile for creating blog posts

all: clean convert install

build: blog.go
	go build

clean:
	go clean
	rm -f fragments/*.html

install: convert build
	go install

convert: 
	mkdir -p ./fragments

	for file in $(shell find org-files/ -name "*.org"); do \
		f=$$(basename $$file .org).html; \
		pandoc -s -o fragments/$$f $$file; \
	done

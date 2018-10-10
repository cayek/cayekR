.PHONY: install document test

install:
	R -e 'devtools::install(pkg = ".")'

test:
	R -e 'devtools::test(pkg = ".")'

document:
	R -e 'devtools::document(pkg = ".")'

revealjs:
	rsync imgs/*[.jpg,.svg] docs/imgs/
	pandoc -t revealjs -s -f markdown -V revealjs-url=./reveal.js --biblio references.bib --katex --filter pandoc-crossref --csl res/chicago-author-date.csl -V history:true -V theme:metropolis presentation.md -o docs/index.html

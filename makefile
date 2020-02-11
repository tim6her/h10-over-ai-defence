revealjs:
	rsync imgs/*[.jpg,.svg,.gif] docs/imgs/
	pandoc -t revealjs -s -f markdown -V revealjs-url=./reveal.js --biblio references.bib --katex --filter pandoc-crossref --filter pandoc-citeproc -V history:true -V theme:metropolis -V controls:false presentation.md -o docs/index.html

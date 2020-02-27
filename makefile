revealjs:
	rsync imgs/*[.jpg,.svg,.gif] docs/imgs/
	pandoc -t revealjs -s -f markdown -V revealjs-url=./reveal.js --biblio references.bib --katex --filter pandoc-crossref --filter pandoc-citeproc --csl=./res/ams-review.csl -V history:true -V theme:metropolis -V controls:false --slide-level 2 presentation.md -o docs/index.html
	pandoc -t revealjs -s -f markdown -V revealjs-url=./reveal.js --biblio references.bib --katex --filter pandoc-crossref --filter pandoc-citeproc --csl=./res/ams-review.csl -V history:true -V theme:metropolis -V controls:false --slide-level 2 backup.md -o docs/backup.html

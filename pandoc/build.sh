pandoc *.md title.yaml -s -o book.html;
pandoc book.html --pdf-engine=xelatex --template=eisvogel.tex --toc --metadata-file=metadata.yaml -o portfolio.pdf

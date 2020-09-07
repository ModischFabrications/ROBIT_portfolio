cd portfolio
pandoc *.md title.yaml --metadata-file=metadata.yaml --pdf-engine=xelatex --template=../templates/eisvogel.tex --toc  -o ../portfolio.pdf

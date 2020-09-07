cd portfolio
pandoc *.md --metadata-file=metadata.yaml --pdf-engine=xelatex --template=../templates/eisvogel.tex --toc -o ../portfolio.pdf

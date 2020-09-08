cd ./portfolio
pandoc *.md --metadata-file=metadata.yaml --pdf-engine=xelatex --template=../templates/eisvogel.tex -o ../portfolio.pdf

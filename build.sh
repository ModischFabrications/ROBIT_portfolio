cd ./portfolio
pandoc *.md --include-in-header=titlesec.tex --metadata-file=metadata.yaml --pdf-engine=xelatex --template=../templates/eisvogel.tex -o ../portfolio.pdf

#!/bin/bash    
cd latex
pdflatex main.tex
mv main.pdf ../FULL_DOCUMENT.pdf
extension='.pdf'
for file in Chapters/*.tex; 
do
    filepath="${file%.*}"
    filename=$(basename "$file")
    fname="${filename%.*}"
    pdflatex -jobname=$fname "\includeonly{$filepath}\input{main}"; 
    pdffilename=$fname$extension
    pdftk $pdffilename cat 1-end output "../individual_chapters/$pdffilename"
    rm $fname*
done
cd ..

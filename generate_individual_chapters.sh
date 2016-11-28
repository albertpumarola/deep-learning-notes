#!/bin/bash    
for file in ./Chapters/*.tex; 
do
    filename=$(basename "$file")
    fname="${filename%.*}"
    pdflatex -jobname=$fname "\includeonly{$file}\input{main}"; 
    mv $fname* PDF_chapters/;
done

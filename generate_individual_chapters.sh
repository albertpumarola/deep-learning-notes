#!/bin/bash    
for file in ./Chapters/*.tex; 
do
    filename=$(basename "$file")
    fname="${filename%.*}"
    pdflatex -jobname=$fname -output-directory=PDF_chapters "\includeonly{the$fname}\input{main}"; 
done

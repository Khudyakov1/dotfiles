#!/bin/sh

filename=$1
target="$(dirname "$filename")/../pdf"
outputfile="$(basename "$filename" .md).pdf"

mkdir -p $target

echo $targ

# -V 'mainfontoptions=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic' \et
	# -V 'mainfont:DejaVuSerif' \
	# -V 'sansfont:DejaVusans.ttf' \

pandoc \
	-t latex \
	--pdf-engine=xelatex \
	-V fontenc=T2A \
	-V 'mainfont:Salma Pro' \
	-V 'geometry:a6paper' \
	-V "geometry:margin=0.3in" \
	-o "$target/$outputfile" $filename &

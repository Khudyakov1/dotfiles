#!/bin/sh

noteFilename="$HOME/Documents/Notes/markdown/notes-$(date +%d-%m-%y).md"

if [ ! -f $noteFilename ]; then
	echo "# Записи от $(date +%d.%m.%d)" > $noteFilename
fi

alacritty -t "Note editor" \
-e \
nvim -c "norm Go" \
	-c "norm Go---" \
	-c "norm Go" \
	-c "norm Go## Заметка [$(date +%H:%M)]" \
	-c "Goyo" \
	-c "norm 50hlll" \
	-c "norm vllllll" \
	-c "norm zz" \
	-c "startinsert" $noteFilename \
	# -c "norm Go" \

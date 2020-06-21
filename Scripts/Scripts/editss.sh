#!/bin/bash


file="$(mktemp).png"

maim -s "$file" && kolourpaint "$file" && \
	 xclip -selection clipboard -t image/png < "$file"

        #curl -F'file=@newest.png' https://0x0.st | xclip -i -selection clipboard &&

rm "$file"


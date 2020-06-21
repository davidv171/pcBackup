#!/bin/sh

# Take clipboard content into youtube-dl put it into meme folder
#
folder="$HOME/Downloads/Meme"
# Save current folder
oldfolder="$(pwd)"
cd "$folder" || exit 1;

youtube-dl "$(xclip -out -selection clipboard)"

cd "$oldfolder" || exit 1;



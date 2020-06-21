#!/bin/bash

username="$wusername"
password="$wpassword"

if [[ -z $username ]]; then
  echo "Missing wusername environment variable. "
  exit
fi
echo "Environment variables present"
dir="$HOME/Screenshots/"
filename="$(date +%Y-%m-%dT%H:%M:%SZ).png"
domain="https://d.davidv7.xyz"
url="https://i.davidv7.xyz/$filename"

screenshot="maim -s $filename"


cd "$dir" &&
  $screenshot &&
  link="$(curl --basic --user "$username:$password" -T "$filename" "$domain")"

if [[ "$link" == *"Created"* ]]; then

  echo "$url" | xclip -selection clip &&
    notify-send "davidv7.xyz" "link in clipboard: $url"

else
  echo "Failed to upload"
fi

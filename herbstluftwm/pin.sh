#!/bin/bash

# Listen for hook emit pin
herbstclient -i '(rule)' | while read -r hook name WINID
do case $name in
       pin)
           class="$(herbstclient get_attr clients.$WINID.class)"
           echo "$class"
           workspace="$(herbstclient get_attr clients.$WINID.tag)"
           herbstclient rule class="$class" tag="$workspace"
           sleep "$1"
           ;;
   esac
done

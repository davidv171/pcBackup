#!/bin/bash


herbstclient --idle | while read hook name winid
do

echo "$hook"
  case $name in
  	  float-steam*) notify-send "Floating steam" && herbstclient floating toggle;;

  esac
done

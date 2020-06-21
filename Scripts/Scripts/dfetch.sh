#!/bin/sh
# can't test BSD test it on your own
# /proc/cpuinfo duplicates information for whatever reason
#
kernelnv=""
kernel=""
if [ -n "$(uname -s)" ];then

	kernel="$(uname -s)"
	kernelnv="$kernel $(uname -r)"

fi

if [ "$kernel" = "Linux" ]; then

	cpufile="/proc/cpuinfo"

	cpuname="$(awk -F': ' '/model name\t: /{print $2;exit} ' "$cpufile")"
	distrofile="/etc/os-release"
	# Source distrofile, read the vars
	. "$distrofile" && distroname="$NAME"
	# DE or WM used
	dewm=""
	displayprot="$(loginctl show-session "$XDG_SESSION_ID" -p Type --value)"

	gtk3file="$HOME/.config/gtk-3.0/settings.ini"

	gtk3theme="$(test -f "$gtk3file" && awk -F'=' '/gtk-theme-name/ {print $2} ' "$gtk3file")"
	gtk3icontheme=""

	if [ -n "$gtk3theme" ];then
		gtk3icontheme="$(awk -F'=' '/gtk-icon-theme-name/ {print $2} ' "$gtk3file")"

	fi

	 echo "$gtk3theme" | grep -i "dark" || \
		grep -q "gtk-application-prefer-dark-theme=1" "$gtk3file" && \
		gtk3theme="$gtk3theme Dark"

	if [ "$displayprot" = "x11" ];then
		dewm="$XDG_CURRENT_DESKTOP"
	else
	# Assume wayland, no idea how to scan for current wm/de
		if [ -n "$WAYLAND_DISPLAY" ];then
		displayprot="Wayland"
		fi
	fi
	memfile="/proc/meminfo"
	maxram="$(awk '/[^0-9]* / {print $2;exit} ' "$memfile")"

	echo "CPU Name: $cpuname"
	echo "Kernel: $kernelnv"
	echo "Distro: $distroname"
	echo "DE/WM: $dewm"
	echo "Display protocol: $displayprot"
	echo "GTK3 Theme: $gtk3theme"
	echo "GTK Icon Theme: $gtk3icontheme"
	echo "Terminal: $TERM"
	echo "Max RAM[kB]: $maxram"
	echo "Editor: $EDITOR"

fi


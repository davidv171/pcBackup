#!/bin/bash

move_sink_inputs() {
    sink="$1"
    [ -n "$sink" ] || return 1

    sink_inputs=$(pactl list sink-inputs) || return 1

    while read -r sink_input; do
        index=$(echo "$sink_input" | grep -oP "\d+$")
        pactl move-sink-input "$index" "$sink" || return 1
    done < <(echo "$sink_inputs" | grep "Sink Input")
}

list_sinks() {
    sinks=$(pactl list sinks short) || return 1
    echo "$sinks" | sed -e "s/\t/\ /g"
}

select_sink() {
    sink="$(list_sinks | rofi -dmenu)" || return 1
    sink="$(echo "$sink" | cut -f 1 -d " ")"
    [ -n "$sink" ] || return 1
    pactl set-default-sink "$sink" || return 1
    move_sink_inputs "$sink" || return 1
}

mute_sink() {
    sink="$(list_sinks | rofi -dmenu)" || return 1
    sink="$(echo "$sink" | cut -f 1 -d " ")"
    [ -n "$sink" ] || return 1

    pactl set-sink-mute "$sink" toggle
}

transform_output(){

    sinks="$(list_sinks)"

    sinksCount="$(echo -n "\n" | wc -c)"

    declare -a sinksArr
    declare -a sinksTransArr

    for (( i=1; i<=sinksCount; i++ ))
    do
	sink=$(echo "$sinks" | cut -f $i -d$'\n')
	sinkIndex=${sink:0:1}
transSink=$(echo "$sink" |\
	    awk '{gsub("module-alsa-card.c","");print}' |\
	    cut -f4-5 -d.)

	sinksTransArr+=( "$transSink" )
	sinksArr+=( "$sinkIndex" )

    done

    choice=$(printf '%s\n' "${sinksTransArr[@]}" | rofi -dmenu)

    for (( i = 0; i<sinksCount; i++ ))
    do
	if [[ ${sinksTransArr[$i]} == "$choice" ]] ; then
	    pactl set-default-sink "${sinksArr[$i]}"
	    move_sink_inputs "${sinksArr[$i]}"
	fi
    done



}

transform_output_short(){

    sinksd=$(pactl list sinks short |\
	awk '{$2=p$2};1' |\
	awk '{gsub("(alsa_output\\.pci-.*\\.[0-9]\\.|module-alsa-card\.c)","");print}')

    choice="$(echo "$sinksd" | rofi -dmenu | cut -f 1 -d " ")"
    move_and_change_sink "$choice"
    pactl set-default-sink "$choice"
    move_sink_inputs "$choice"



}

move_and_change_sink(){

    pactl set-default-sink "$1"
    move_sink_inputs "$1"
}

case "$1" in
    mute) mute_sink || exit 1;;

    list) transform_output || exit 1;;

    ch) transform_output_short || exit 1;;

    *) select_sink || exit 1;;

esac





exit 0

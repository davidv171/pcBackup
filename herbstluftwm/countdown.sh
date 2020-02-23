#!/bin/bash

for (( c=$1; c>=0; c-- ))
do
	echo -e \\033c &&\
		echo -n "$c." | figlet -c -k &&\
		sleep 1;
done


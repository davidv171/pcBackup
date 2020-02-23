#!/bin/bash

for (( c=0; c<=$1; c++ ))
do
	echo -e \\033c &&\
		echo -n "$c." | figlet -c -k &&\
		sleep 1;
done

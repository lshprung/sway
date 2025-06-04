#!/bin/bash

if [[ -z $1 ]]; then
	echo -n "Usage: "
	echo -n $0
	echo " [up/down/mute/set] [%] (default is 5%)"

elif [[ $1 == "up" ]]; then
	if [[ -n $2 ]]; then
		amixer -D pulse sset Master $2%+
	else
		amixer -D pulse sset Master 5%+
	fi

elif [[ $1 == "down" ]]; then
	if [[ -n $2 ]]; then
		amixer -D pulse sset Master $2%-
	else
		amixer -D pulse sset Master 5%-
	fi

elif [[ $1 == "mute" ]]; then
	amixer -D pulse sset Master 0%

elif [[ $1 == "set" ]] && [[ -n $2 ]]; then
	amixer -D pulse sset Master $2%

elif [[ -n $1 ]]; then
	amixer -D pulse sset Master $1%

fi

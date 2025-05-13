#!/bin/bash

song_data=
symbol=

song_status (){
img=`playerctl metadata mpris:artUrl`

	if [[ "$img" == "file://"* ]]; then
		img=`echo $img | cut -b -7`
	fi

	status=$(playerctl status)
	if [[ "$status" == "Paused" ]]; then
		symbol="||"
	elif [[ "$status" == "Playing" ]]; then
	       	symbol="|>"
	else echo "Nenhum player foi encontrado!"; exit
	fi
	
	timg -g7x4 $img
	echo "$symbol $artist - $title"

}

now_playing (){
title=`playerctl metadata title`
artist=`playerctl metadata artist`
img=`playerctl metadata mpris:artUrl | cut -b 7-`
song=$song_data

	if [[ "$song" != "$title" ]]; then
		clear
		song_data="$title"
		song_status
	fi
}

while [ true ]
do

now_playing

read -t 1 input
	if [[ "$input" == "q" ]] ; then
		playerctl play-pause
		clear
		song_status
	fi
	if [[ "$input" == "e" ]] ; then
		playerctl next
		echo "Pulou!"
		sleep 0.5
		clear
		now_playing
	fi
sleep 2
done

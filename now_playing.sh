#!/bin/bash

echo '' > song.data

symbol="|>"

song_status (){
img=`playerctl metadata mpris:artUrl | cut -b 6-`

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
song=`tail -n -1 song.data`


	if [[ "$song" != "$artist - $title" ]]; then
		clear
		echo "$artist - $title" >> song.data
		song_status
	fi
}

while [ true ]
do

now_playing

read -t 2 input
	if [[ "$input" == "q" ]] ; then
		playerctl play-pause
		input='\0'
		sleep 0.5
		clear
		song_status
	fi
	if [[ "$input" == "e" ]] ; then
		playerctl next
		echo "Pulou!"
		input='\0'
		sleep 0.5
		now_playing
	fi
sleep 2
done

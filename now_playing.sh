#!/bin/bash

song_data=
symbol=
valor=

song_status() {
  img=$(playerctl metadata mpris:artUrl)

  if [[ "$img" == "file://"* ]]; then
    img=$(echo $img | awk -F '://' '{printf $2}')
  fi

  status=$(playerctl status)
  if [[ "$status" == "Paused" ]]; then
    symbol="||"
  elif [[ "$status" == "Playing" ]]; then
    symbol="|>"
  else
    echo "Nenhum player foi encontrado!"
    exit
  fi

  #timg -g6x4 $img --clear=every
  windowSize=$(kitten icat --print-window-size)

  x=$(echo $windowSize | awk -F 'x' '{printf $1}')
  y=$(echo $windowSize | awk -F 'x' '{printf $2}')

  if [[ $x < $y ]]; then
    valor=$x
  else
    valor=$y
  fi
  valor=$(($valor / 2))
  tamanho="$valor,$valor,$valor,$valor"
  kitten icat --align=center -n --use-window-size $tamanho $img
  echo "$symbol $artist - $title"
}

now_playing() {
  title=$(playerctl metadata title)
  artist=$(playerctl metadata artist)
  img=$(playerctl metadata mpris:artUrl | cut -b 7-)
  song=$song_data

  if [[ "$song" != "$title" ]]; then
    clear
    song_data="$title"
    song_status
  fi
}

while [ true ]; do

  now_playing

  read -t 1 input
  if [[ "$input" == "q" ]]; then
    playerctl play-pause
    clear
    song_status
  fi

  if [[ "$input" == "e" ]]; then
    playerctl next
    echo "Pulou!"
    sleep 0.5
    clear
    now_playing
  fi

  if [[ "$input" = "stop" ]]; then
    echo "thank you for using the system"
    playerctl stop
    exit
  fi

  if [[ "$input" = "+" ]]; then
    amixer set Master 10%+ -q
    echo "Volume aumentado em 10%!"
    clear
    song_status
  fi

  if [[ "$input" = "-" ]]; then
    amixer set Master 10%- -q
    echo "Volume diminuido em 10%!"
    sleep 0.5
    clear
    song_status
  fi

  if [[ "$input" = "shuffle" ]]; then
    playerctl shuffle Toggle
    echo "Playlist shuffled!"
    sleep 0.5
    clear
    song_status
  fi

  sleep 2
done

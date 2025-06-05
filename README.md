# CLI-Player
One might ask: why? And for that I answer you: why not?

Sometimes you just don't feel like alt tabbing your way to your browser while working with the CLI, so this might come as convenient.

There's still a lot of room for improvement as I get my head around bash scripts more, but note that support isn't guaranteed considering this is mostly a project to practice.

## Setting up

+ Playerctl for gathering mpris and xesam info
+ Kitty terminal as a terminal for generating and displaying images
+ Cava for audio visualization

### For Debian/Ubuntu
```bash
# Installing dependencies
sudo apt install -y playerctl
sudo apt install -y kitty
sudo apt install -y cava
sudo apt install -y git

#Clone to your path of choice
git clone https://github.com/AJobim/CLI-Player.git
```

## Usage instructions

**WARNING, ONLY WORKS WITH HYPRLAND FOR NOW!!!**

After downloading, run the following to make the archive executable. Remember to change the path to where the script was saved.
<pre>sudo chmod +x path-to-script/now_playing.sh</pre>

For now, CLI-Player only supports media after being started, as it needs the song metadata to operate with playerctl.
Once you've started a song on spotify or youtube, run the script. It will showcase the album cover and name of artist and song.

### Supported controls as of now
+ **q** - play/pause
+ **e** - skips the current song

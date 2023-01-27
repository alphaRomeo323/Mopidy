#!/bin/sh

echo "Scanning local files"
mkdir -p ~/.config/mopidy
echo -e "[local]\n  media_dir=/music" > ~/.config/mopidy/mopidy.conf
mopidy local scan

echo "Starting snapserver and mopidy..."

snapserver &
mopidy -o "audio/output=audioresample!audioconvert!audio/x-raw,rate=48000,channels=2,format=S16LE!filesink location=/tmp/snapfifo" -o "http/hostname=::" -o "mpd/hostname=::" -o "local/media_dir=/music"
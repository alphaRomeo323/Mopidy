#!/bin/sh

### because of strong depends on python3.10, this script is failed to mount.
# echo "Scanning local files"
# mkdir -p ~/.config/mopidy
# echo -e "[local]\n  media_dir=/music" > ~/.config/mopidy/mopidy.conf
# mopidy local scan

echo "test"
ls -l /music

echo "Starting snapserver and mopidy..."

snapserver &
mopidy -o "audio/output=audioresample!audioconvert!audio/x-raw,rate=48000,channels=2,format=S16LE!filesink location=/tmp/snapfifo" -o "http/hostname=::" -o "mpd/hostname=::" -o "file/media_dirs=/music|Music"
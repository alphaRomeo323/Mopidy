#!/bin/sh

mkdir -p ~/.config/mopidy
echo -e "[local]\n  media_dir=/music" > ~/.config/mopidy/mopidy.conf

echo "Starting snapserver and mopidy..."

snapserver &
mopidy -o "audio/output=audioresample!audioconvert!audio/x-raw,rate=48000,channels=2,format=S16LE!filesink location=/tmp/snapfifo" \
 -o "http/hostname=::" -o "mpd/hostname=::" -o "file/enabled=false" -o "local/media_dir=/music" -o "youtube/youtube_dl_package=yt_dlp" \
 -o "soundcloud/auth_token=$MPD_SOUNDCLOUD_TOKEN" -o "iris/snapcast_host=$MPD_SNAPCAST_HOSTNAME" -o "iris/snapcast_port=443"

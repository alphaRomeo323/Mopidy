FROM alpine

COPY . .
RUN apk add bash sudo mopidy py3-pip snapcast yt-dlp gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad && pip install -r requirements.txt && rm requirements.txt && mkdir /playlist && echo "mopidy ALL=(root) NOPASSWD: $(pip show mopidy-iris | grep Location | cut -d " " -f 2)/mopidy_iris/system.sh" > /etc/sudoers.d/mopidy
WORKDIR /usr/lib/python3.11/site-packages/mopidy_iris
RUN cp system.sh system.sh.org && sed '10,13d' system.sh.org | sed '12d' > system.sh && sudo -u mopidy ./system.sh check
WORKDIR /
VOLUME /config /playlists /music
EXPOSE 6680 1780
ENTRYPOINT snapserver & mopidy --config /config/mopidy.conf -o "audio/output=audioresample!audioconvert!audio/x-raw,rate=48000,channels=2,format=S16LE!filesink location=/tmp/snapfifo" -o "youtube/youtube_dl_package=yt_dlp"
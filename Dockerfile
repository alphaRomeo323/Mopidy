FROM alpine

COPY requirements.txt .
RUN apk add sudo mopidy py3-pip snapcast yt-dlp gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad && pip install -r requirements.txt && rm requirements.txt && echo -e "mopidy  ALL=NOPASSWD: /usr/bin/mopidy" > /etc/sudoers.d/mopidy

COPY start.sh .
ENTRYPOINT ./start.sh


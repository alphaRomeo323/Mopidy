FROM alpine

COPY requirements.txt .
RUN apk add mopidy py3-pip snapcast yt-dlp && pip install -r requirements.txt && rm requirements.txt

COPY start.sh .
ENTRYPOINT ./start.sh


FROM alpine

COPY requirements.txt .
RUN apk add mopidy py3-pip snapcast gst-plugins-base gst-plugins-good gst-plugins-ugly gst-plugins-bad && pip install -r requirements.txt && rm requirements.txt

COPY start.sh .
ENTRYPOINT ./start.sh


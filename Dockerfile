FROM alpine

COPY requirements.txt .
RUN apk add mopidy py3-pip snapcast && pip install -r requirements.txt && rm requirements.txt

COPY start.sh .
ENTRYPOINT ./start.sh


#!/bin/bash
cron

STREAM="${STREAM:rtsp}"

while true; do
    echo "$(date --iso=seconds) | starting ffmpeg"

    ffmpeg \
      -hide_banner -y \
      -loglevel error \
      -rtsp_transport tcp \
      -use_wallclock_as_timestamps 1 \
      -i "$STREAM" \
      -vcodec copy \
      -acodec copy \
      -f segment \
      -reset_timestamps 1 \
      -segment_time 900 \
      -segment_format mkv \
      -segment_atclocktime 1 \
      -strftime 1 /output/%Y-%m-%d-%H-%M-%S.mkv
      #  -loglevel error \

  CODE=$?

  echo "$(date --iso=seconds) | ffmpeg finished with exit code $CODE"
done
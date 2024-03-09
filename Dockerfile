FROM ubuntu:23.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

RUN apt update && apt install -y ffmpeg cron coreutils
RUN crontab -l | { cat; echo "*/5 * * * * bash /app/src/apply-limit.sh > /proc/1/fd/1 2>/proc/1/fd/2"; } | crontab -

CMD ["/bin/bash", "./src/run.sh"]

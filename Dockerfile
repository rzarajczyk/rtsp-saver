FROM ubuntu:23.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

RUN apt update && apt install -y ffmpeg cron coreutils
RUN crontab -l | { cat; echo "*/2 * * * * bash /app/src/apply-limit.sh > /dev/stdout"; } | crontab -

CMD ["/bin/bash", "./src/run.sh"]

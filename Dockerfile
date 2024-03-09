FROM ubuntu:23.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

RUN apt update && apt install -y ffmpeg cron
RUN crontab -l | { cat; echo "*/15 * * * * bash /app/apply-limit.sh"; } | crontab -

CMD ["/bin/bash", "./src/run.sh"]

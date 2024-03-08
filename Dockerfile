FROM ubuntu:23.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

RUN apt update && apt install -y ffmpeg

CMD ["/bin/bash", "./src/run.sh"]

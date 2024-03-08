FROM ubuntu:22.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y ffmpeg

CMD ["/bin/bash", "./src/run.sh"]

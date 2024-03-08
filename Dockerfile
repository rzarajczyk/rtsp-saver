FROM ubuntu:22.10

RUN mkdir -p /output

WORKDIR /app

COPY . .

CMD ["/bin/bash", "./src/run.sh"]

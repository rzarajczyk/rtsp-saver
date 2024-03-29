# rtsp-saver

Saves the RTSP streams (from the security camera) to files in MKV format.
Build especially for usage in docker

The recordings will be saved in files of approximately 15 minutes length

## Usage: docker compose

```yaml
version: '3.2'
services:
  rtsp-saver:
    image: rzarajczyk/rtsp-saver:latest
    volumes:
      - /share/recordings:/output
    environment:
      - STREAM=rtsp://<<camera-stream-url>>
      - SPACE_LIMIT=20G
```

Important configuration:

- volume mounted in `/output` will be a place where the recordings are saved
- env variable `STREAM` - the url of the camera stream (check your camera manual for details)
- env variable `SPACE_LIMIT` - the limit of disk space which the recordings may take; if the recordings exceed the limit, the
  oldest ones will be deleted


## Noteworthy links:

 - [Saving RTSP Camera Streams with FFmpeg](https://medium.com/@tom.humph/saving-rtsp-camera-streams-with-ffmpeg-baab7e80d767)
 - [HOW TO RUN CRON JOBS INSIDE DOCKER](https://lostindetails.com/articles/How-to-run-cron-inside-Docker)
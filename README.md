# rtsp-saver

Saves the RTSP streams (from the security camera) to files in MKV format.
Build especially for usage in docker

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
- env STREAM - the url of the camera stream (check your camera manual for details)
- env SPACE_LIMIT - the limit of disk space which the recordings may take; if the recordings exceed the limit, the
  oldest ones will be deleted
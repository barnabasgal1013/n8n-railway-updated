FROM mwader/static-ffmpeg:7.1.1 AS ffmpeg

FROM n8nio/n8n:latest

USER root

COPY --from=ffmpeg /ffmpeg /usr/local/bin/ffmpeg
COPY --from=ffmpeg /ffprobe /usr/local/bin/ffprobe

RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node

USER node

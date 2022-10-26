FROM alpine:edge
ARG VERSION
RUN apk add --no-cache --repository=https://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
    librespot=$VERSION
CMD [ 'librespot', \
      '--name Raspotify', \
      '--enable-volume-normalisation', \
      '--bitrate 320', \
      '--disable-audio-cache', \
      '--initial-volume 60' ]


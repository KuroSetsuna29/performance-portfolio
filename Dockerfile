FROM ghcr.io/linuxserver/baseimage-kasmvnc:ubuntunoble

LABEL org.opencontainers.image.authors="KuroSetsuna29"
LABEL org.opencontainers.image.source=https://github.com/KuroSetsuna29/performance-portfolio

RUN apt-get update \
    && apt-get install -y openjdk-17-jre libswt-gtk-4-jni libswt-gtk-4-java wget jq \
    && apt-get clean

ENV TZ=America/Toronto
ENV UMASK=000
ENV PUID=99
ENV PGID=100

COPY /root /

RUN chown -R $PUID:$PGID /app

EXPOSE 3000

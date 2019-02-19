FROM debian:stable-slim

MAINTAINER Momper14 <moritz.momper@gmail.com>

RUN apt-get update && \
        apt-get install -y --no-install-recommends \
        ca-certificates

RUN useradd -mUs /bin/bash -d /7daysded 7days

USER 7days

ADD --chown=7days:7days data/7daysded /7daysded
ADD --chown=7days:7days startserver.sh /7daysded/startserver.sh
ADD --chown=7days:7days data/Mods /7daysded/Mods
RUN mkdir -p /7daysded/logs /7daysded/.local/share/7DaysToDie
ADD --chown=7days:7days data/7daysded/serverconfig.xml /7daysded/.local/share/7DaysToDie/serverconfig.xml

# docker dont likes me
#USER root
#RUN chown -R 7days:7days /7daysded/Mods /7daysded/logs
#USER 7days

WORKDIR /7daysded

VOLUME ["/7daysded/Mods", "/7daysded/.local/share/7DaysToDie"]

# remote
EXPOSE 8080-8081/tcp
# Alloc's mods map
EXPOSE 8082/tcp

EXPOSE 26900/tcp 26900-26902/udp

ENV START_ARGS ""

ENTRYPOINT ["./startserver.sh",  "-configfile=/7daysded/.local/share/7DaysToDie/serverconfig.xml", "$START_ARGS"]
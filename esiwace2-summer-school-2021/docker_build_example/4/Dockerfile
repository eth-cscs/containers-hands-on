FROM debian:buster

COPY script.sh /app/

RUN chmod 755 /app/script.sh

RUN apt-get update && apt-get install -y wget

ENV NAME JohnDoe

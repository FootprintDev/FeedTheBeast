FROM ubuntu:latest

RUN ["apt-get", "update"]
RUN ["apt-get", "-y", "upgrade"]
RUN ["apt-get", "install", "-y", "openjdk-11-jre-headless", "wget"]

COPY ["eula.txt", "/opt"]
COPY ["server.properties", "/opt"]

WORKDIR /opt

RUN ["wget", "-O", "mod", "https://api.modpacks.ch/public/modpack/35/2059/server/linux"]
RUN ["chmod", "+x", "mod"]

RUN ["./mod", "35", "--auto"]

ENTRYPOINT [ "bash", "start.sh" ]
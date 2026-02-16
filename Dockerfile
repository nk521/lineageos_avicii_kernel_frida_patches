FROM --platform=linux/amd64 ubuntu:22.04

RUN apt update
RUN apt-get install bc bison build-essential ccache curl cpio flex git git-lfs gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev libelf-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev python3 python-is-python3 -y

WORKDIR /home/kernel

CMD [ "entrypoint.sh" ]

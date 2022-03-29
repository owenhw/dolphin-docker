# Run dolphin in a container

# Base docker image
FROM ubuntu:18.04


#Install Dolphin and prerequisites
RUN apt-get update && apt-get install -y \
   hicolor-icon-theme \
   libgl1-mesa-dri \
   libgl1-mesa-glx \
   libpulse0 \
   libv4l-0 \
   fonts-symbola \
   # /Start section/ This has been added because needed in my unigine-heaven benchmark test, this doesn't
   # takes a lot of disk space, but might be not necessary. TODO : try to remove them one by one and test
   libfontconfig1 \
   libxrender1 \
   libxrandr2 \
   libxinerama1 \
   libopenal1 \
   mesa-utils \
   # /End section/
   dolphin-emu-master \
   dolphin-emu-data \
   && apt-get autoremove \
   && rm -rf /var/lib/apt/lists/* \
   && rm -rf /src/*.deb \
   && mkdir -p "/root/.config/dolphin-emu" \
   && mkdir "/roms"


VOLUME /root/.config/dolphin-emu
VOLUME /roms

# ENTRYPOINT ["/usr/games/dolphin-emu"]
# CMD ["-u /config/"]
CMD ["/usr/games/dolphin-emu"]

FROM cm2network/steamcmd

USER root
RUN apt-get update && apt-get install -y \
    libcompress-raw-zlib-perl
COPY init.sh /home/steam/init.sh
RUN chmod +x /home/steam/init.sh && chown -R steam:steam /home/steam

USER steam
WORKDIR /home/steam/
RUN bash -x /home/steam/steamcmd/steamcmd.sh +login anonymous +quit

RUN curl -sL https://raw.githubusercontent.com/arkmanager/ark-server-tools/master/netinstall.sh | \
    bash -s -- --me --perform-user-install --yes-i-really-want-to-perform-a-user-install

ENTRYPOINT  ["/home/steam/init.sh"]

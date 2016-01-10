FROM debian:wheezy
MAINTAINER Daniel Kühne <dkhmailto@googlemail.com>

ENV TZ Europe/Berlin

RUN echo $TZ > /etc/timezone && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure tzdata

RUN set -x && \ 
  echo "deb http://archive.gplhost.com/debian juno-backports main" > /etc/apt/sources.list.d/juno-backports.list && \
  echo "deb http://archive.gplhost.com/debian juno main" > /etc/apt/sources.list.d/juno.list && \
  apt-get update && \
  apt-get install -y --force-yes gplhost-archive-keyring vim && \
  apt-get update && \
  # DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends \
    python-ceilometerclient \
    python-cinderclient \
    python-glanceclient \
    python-heatclient \
    python-keystoneclient \
    python-novaclient \
    python-neutronclient \
    python-saharaclient \
    python-swiftclient \
    python-troveclient && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

CMD ["bash"]

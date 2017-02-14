FROM ubuntu:16.04

RUN set -x \
    && apt-get update \
    && apt-get install -y software-properties-common \
    # enable multi-verse
    && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu xenial multiverse" \
    && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu xenial-updates multiverse" \
    && add-apt-repository -y "deb http://archive.ubuntu.com/ubuntu xenial-security multiverse" \
    && apt-get remove -y --autoremove software-properties-common \
    && apt-get update \
    && apt-get install -y \
                          libboost-all-dev \
                          subversion \
                          git-core \
                          tar \
                          unzip \
                          wget \
                          bzip2 \
                          build-essential \
                          autoconf \
                          libtool \
                          libxml2-dev \
                          libgeos-dev \
                          libgeos++-dev \
                          libpq-dev \
                          libbz2-dev \
                          libproj-dev \
                          munin-node \
                          munin \
                          libprotobuf-c0-dev \
                          protobuf-c-compiler \
                          libfreetype6-dev \
                          libpng12-dev \
                          libtiff5-dev \
                          libicu-dev \
                          libgdal-dev \
                          libcairo-dev \
                          libcairomm-1.0-dev \
                          apache2 \
                          apache2-dev \
                          libagg-dev \
                          liblua5.2-dev \
                          ttf-unifont \
                          lua5.1 \
                          liblua5.1-dev \
                          libgeotiff-epsg \
                          node-carto \
                          python \
                          zlib1g-dev \
                          clang \
                          make \
                          pkg-config \
                          curl \
                          osm2pgsql

COPY scripts/install-mapnik.sh /tmp
RUN set -e \
    && mkdir -p /opt/mapnik \
    && cd /opt/mapnik \
    && /tmp/install-mapnik.sh \
    && rm /tmp/install-mapnik.sh

COPY scripts/install-mod-tile.sh /tmp
RUN set -e \
    && mkdir -p /opt/mod_tile \
    && cd /opt/mod_tile \
    && /tmp/install-mod-tile.sh \
    && rm /tmp/install-mod-tile.sh

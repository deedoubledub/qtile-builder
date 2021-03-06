FROM ubuntu:20.04

VOLUME /build

# make tzdata install non-interactive
ENV DEBIAN_FRONTEND=noninteractive
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime

# install build deps
RUN apt-get update && apt-get -y install \
  python3 \
  python3-pip \
  python3-xcffib \
  python3-cairocffi \
  python3-cffi \
  libpulse-dev

# install fpm
RUN apt-get -y install \
  ruby \
  ruby-dev \
  rubygems \
  build-essential && \
  gem install --no-document fpm

# build script
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# add xsession
COPY ./qtile.desktop /qtile.desktop

ENTRYPOINT ["/entrypoint.sh"]

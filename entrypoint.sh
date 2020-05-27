#!/bin/bash

# clean
rm -rf /build/*

# install qtile
pip3 install --prefix /build/usr qtile

# add xsession
mkdir -p /build/usr/share/xsessions
cp /qtile.desktop /build/usr/share/xsessions/qtile.desktop

# build the deb with fpm
cd /build
fpm --input-type dir \
  --output-type deb \
  --prefix usr \
  --name qtile \
  --vendor qtile.org \
  --category x11 \
  --description "A full-featured, hackable tiling window manager written and configured in Python" \
  --url http://www.qtile.org \
  --version "$(PYTHONPATH=/build/usr/lib/python3.8/site-packages/ /build/usr/bin/qtile --version)" \
  --depends python3 \
  --depends python3-xcffib \
  --depends python3-cairocffi \
  --depends python3-dbus \
  --depends libpangocairo-1.0-0 \
  ./usr

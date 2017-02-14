#!/usr/bin/env bash
set -euo pipefail

git clone git://github.com/openstreetmap/mod_tile.git
cd mod_tile
./autogen.sh
./configure
make
make install
make install-mod_tile
ldconfig

#!/usr/bin/env bash
set -euo pipefail

git clone https://github.com/mapnik/mapnik mapnik-3.x --depth 10
cd mapnik-3.x
git fetch --tags
git checkout v3.0.13
git submodule update --init
source bootstrap.sh
./configure CUSTOM_CXXFLAGS="-D_GLIBCXX_USE_CXX11_ABI=0"
make
# make test
make install

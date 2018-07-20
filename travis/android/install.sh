#!/bin/bash

set -e

export CCACHE_CPP2=yes

unset CC
unset CXX
export PATH=$HOME/android-toolchain/bin:$PATH

ccache -M 1G
ccache -s

./autogen.sh
CC="ccache arm-linux-androideabi-clang" CXX="ccache arm-linux-androideabi-clang++" CFLAGS="-mthumb" CXXFLAGS="-mthumb" LIBS="-lstdc++" ./configure --host=arm-linux-androideabi
make -j3

ccache -s

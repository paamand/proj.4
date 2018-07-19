#!/bin/bash

set -e

export CCACHE_CPP2=yes

unset CC
unset CXX
export PATH=$HOME/android-toolchain/bin:$PATH

ccache -M 1G
ccache -s

./autogen.sh
CC="ccache i686-linux-android-clang" CXX="ccache i686-linux-android-clang++" CFLAGS="-Werror -O2" CXXFLAGS="-Werror -O2" LIBS="-lstdc++" ./configure --host=i686-linux-android
#--with-libz=internal --with-threads
make -j3

ccache -s

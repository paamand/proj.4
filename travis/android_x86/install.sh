#!/bin/bash

set -e

export CCACHE_CPP2=yes

unset CC
unset CXX
export PATH=$HOME/android-toolchain/bin:$PATH

ccache -M 1G
ccache -s

./autogen.sh
#sed -i -e 's/std::to_string/to_string/g' ./ogr/ogrsf_frmts/cad/libopencad/dwg/r2000.cpp #Needed due to missing std::to_string support in x86 android (replaces)
CC="ccache i686-linux-android-clang" CXX="ccache i686-linux-android-clang++" CFLAGS="-mthumb -Werror -O2" CXXFLAGS="-mthumb -Werror -O2" LIBS="-lstdc++" ./configure --host=i686-linux-android
#--with-libz=internal --with-threads
make -j3

ccache -s
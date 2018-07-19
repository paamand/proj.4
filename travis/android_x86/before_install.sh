#!/bin/bash

set -e

./travis/before_install.sh

wget https://dl.google.com/android/repository/android-ndk-r17b-linux-x86_64.zip
unzip -q android-ndk-r17b-linux-x86_64.zip
android-ndk-r17b/build/tools/make-standalone-toolchain.sh --platform=android-24 --install-dir=$HOME/android-toolchain --stl=libc++ --arch=x86

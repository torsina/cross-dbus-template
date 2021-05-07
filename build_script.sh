#!/bin/bash

docker build -t rustcross:dbus-aarch64 .

set -o errexit
set -o nounset
set -o xtrace

readonly TARGET_ARCH=aarch64-unknown-linux-gnu
readonly LINK_FLAGS='-L /usr/aarch64-linux-gnu/lib/ -L /usr/lib/aarch64-linux-gnu/'

RUSTFLAGS=${LINK_FLAGS} cross build +nightly --release --target=${TARGET_ARCH}

cp target/aarch64-unknown-linux-gnu/release/report-creator $HOME/test

chmod +x $HOME/test

$HOME/test
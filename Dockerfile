# Base image for rapsberrypi 3 target
FROM rustembedded/cross:aarch64-unknown-linux-gnu

# https://github.com/rust-embedded/cross/blob/master/docker/xargo.sh

RUN curl --retry 3 -sSfL https://sh.rustup.rs -o rustup-init.sh

RUN sh rustup-init.sh -y --no-modify-path --profile minimal --default-toolchain nightly
# Install libdbus libraries and pkg-config
RUN dpkg --add-architecture arm64 && apt-get update && apt-get install --assume-yes libdbus-1-dev libdbus-1-dev:arm64 pkg-config
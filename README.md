I was trying to find how to cross-compile ``dbus-codegen`` from windows x64 to aarch64 linux

To compile ``dbus-codegen``, clone the `dbus` crate repo, and copy at it's root these files: ``build_script.sh``, `cross.toml` and `Dockerfile`. Then run `build_script.sh`

I found this that worked (based myself off `libdbus-sys`'s [cross-compile script](https://github.com/diwic/dbus-rs/blob/master/libdbus-sys/cross_compile.md))

This template can also be used in place to compile crates needing the ``dbus`` crate in general.

the bash script should create the docker image then run ``cross`` with the appropriate env vars

This template can be edited to whichever build target ``cross`` has a docker image for and that `libdbus` has a built library for.

To edit the target, you need to edit it inside ``build_script.sh``, `cross.toml` and in the `Dockerfile` from `arm64/aarch64` to whatever your target is
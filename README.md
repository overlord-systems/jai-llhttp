# jai-llhttp

Jai bindings for the [llhttp](https://github.com/nodejs/llhttp) HTTP parser (`v9.2.1`).

## Installation

Windows: Download `libllhttp-clang-x86_64-msvc.so` from releases and rename to `libllhttp.so` and place it next to your executable. built with `clang 18.1.8 x86_64 msvc`.

Linux: Download `libllhttp-linux-x86_64-glibc.so` from releases and rename to `libllhttp.so` and place it next to your executable. Built on Debian 11 Bullseye (`glibc`). Should work on Debian, Ubuntu, and such. You can build on Alpine (e.g. using Docker) if you want `musl`.

MacOS: We don't support MacOS (yet!). If you want to suppor this you will need to follow build instructions of [llhttp](https://github.com/nodejs/llhttp) to get binaries, and then to update `generate.jai` and then run `jai generate`.

If you don't plan to run `generate.jai`, you can delete `generate.jai` and the `include` directory.

## Building Binaries

Clang is required to run `make` on llhttp. You can down the appropriate Clang
for your platform from [here](https://github.com/llvm/llvm-project/releases/tag/llvmorg-18.1.8).

Add the Clang `bin` folder to your PATH.

Clone [llhttp](https://github.com/nodejs/llhttp), run `npm ci`, then `make` (while ensuring Clang is in your PATH). The build folder will be populated with static and shared libraries.

### Linux Cross-Compilation

You can use the previous instructions to build on Linux (tested on Debian/Ubuntu). However, you can also cross-compile to linux using Docker.

A Dockerfile (`Dockerfile.linux_glibc`) is provided that will clone llhttp and build it on a Debian machine. This Dockerfile can be run on Windows (and probably MacOS) to cross-compile. More instructions available inside the Dockerfile.

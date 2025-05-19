# jai-llhttp

Jai bindings for the [llhttp](https://github.com/nodejs/llhttp) HTTP parser (`v9.2.1`).

## Installation

Windows: Download `libllhttp.dll` from releases and place it next to your executable.

Linux: Download `libllhttp.so` from releases and place it next to your executable.

MacOS: We don't support MacOS (yet!). If you want to suppor this you will need to follow build instructions of [llhttp](https://github.com/nodejs/llhttp) to get binaries, and then to update `generate.jai` and then run `jai generate`.

Windows binaries are built with `clang 18.1.8 x86_64 msvc`.

If you don't plan to run `generate.jai`, you can delete `generate.jai` and the `include` directory.

# Pluto
[English](README.md)

Pluto is a code obfuscator built on top of LLVM 14.0.6 (more in the future...). In summary, Pluto converts the source code into a functionally equivalent but much more complicated form at compile-time, protecting your software from being cracked.

## Installation
Download source code:
```
$ git clone https://github.com/bluesadi/Pluto.git
```
### Ubuntu
Install z3 (required by MBAObfuscation):
```
$ sudo apt install libz3-dev 
```
Install Ninja and other dependencies:
```
$ sudo apt install ninja-build cmake python3 gcc g++
```
Build and install Pluto to `./install` directory:
```
$ mkdir -p build
$ cmake -G Ninja -S . -B build \
        -DCMAKE_C_COMPILER="gcc" \
        -DCMAKE_CXX_COMPILER="g++" \
        -DCMAKE_INSTALL_PREFIX="install" \
        -DCMAKE_BUILD_TYPE=Release
$ ninja -j`nproc` -C build install
```
Or:
```
$ ./build.sh
```

## Usage
On linux:
```
./clang -O3 -flto -fuse-ld=lld -mllvm -passes=mba,sub,idc,bcf,fla,gle -Xlinker -mllvm -Xlinker -passes=hlw,idc -target x86_64-w64-mingw32 notepad.c -o llvm_notepad3.exe -v -L/usr/lib/gcc/x86_64-w64-mingw32/12-win32
```

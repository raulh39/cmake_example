# What

In this repo, I will be providing examples of how I believe modern CMake should be used.

Most of the information is drawn from the book "Professional CMake: A Practical Guide," in its 19th edition, which is geared towards CMake 3.30.

## Plan

My idea is to create:
* Library
* Executable that uses the library
* Something more elaborate like gRPC
* Tests
* Perhaps my own code generator
* support for ccache
* Suport for sanitizers
* Must be installable


And then compile them using:
* Ninja
* Ninja multiconf

And using:
* The system's gcc
* The system's clang
* Cross-compiling to Windows using clang (?)

I also want to include the instructions here on how to use all of this

# Instructions

These instructions assume we are in the parent directory of the repository and
that the name of the directory for the repository is "cmake_examples".

## Ninja + System's gcc

```
cmake \
-DCMAKE_BUILD_TYPE:STRING=Debug \
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
-S cmake_examples \
-B build_gcc_ninja \
-G Ninja

cmake --build build_gcc_ninja

ctest --test-dir build_gcc_ninja
```

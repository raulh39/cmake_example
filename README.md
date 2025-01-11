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

## Ninja + gcc

### Using presets
```
env -C cmake_examples cmake --workflow --preset aw-ninja-gcc --fresh
```

### Not using presets
```
cmake \
-DCMAKE_BUILD_TYPE:STRING=Release \
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
-S cmake_examples \
-B build_gcc_ninja \
-G Ninja

cmake --build build_gcc_ninja

ctest --test-dir build_gcc_ninja

env -C build_gcc_ninja cpack -G TGZ
```

### Install
```
rm -rf installation_gcc_ninja &&
cmake --install build_gcc_ninja --prefix installation_gcc_ninja
```

### Ninja multiconfig + gcc
### Using presets
```
env -C cmake_examples cmake --workflow --preset aw-ninjamulti-gcc --fresh
```

### Not using presets
```
cmake \
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
-S cmake_examples \
-B build_gcc_ninja_multi \
-G "Ninja Multi-Config"

cmake --build build_gcc_ninja_multi --config Release

ctest --test-dir build_gcc_ninja_multi -C Release

env -C build_gcc_ninja_multi cpack -G TGZ -C Release
```

### Install
```
rm -rf installation_gcc_ninja_multi &&
cmake --install build_gcc_ninja_multi --config Release --prefix installation_gcc_ninja_multi
```

## Ninja + clang

### Using presets
```
env -C cmake_examples cmake --workflow --preset aw-ninja-clang --fresh
```

### Not using presets
```
cmake \
-DCMAKE_BUILD_TYPE:STRING=Release \
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
-S cmake_examples \
-B build_clang_ninja \
-G Ninja

cmake --build build_clang_ninja

ctest --test-dir build_clang_ninja

env -C build_clang_ninja cpack -G TGZ
```

### Install
```
rm -rf installation_clang_ninja &&
cmake --install build_clang_ninja --prefix installation_clang_ninja
```

### Ninja multiconfig + clang
### Using presets
```
env -C cmake_examples cmake --workflow --preset aw-ninjamulti-clang --fresh
```

### Not using presets
```
cmake \
-DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=TRUE \
-DCMAKE_CXX_COMPILER:FILEPATH=/usr/bin/g++ \
-S cmake_examples \
-B build_clang_ninja_multi \
-G "Ninja Multi-Config"

cmake --build build_clang_ninja_multi --config Release

ctest --test-dir build_clang_ninja_multi -C Release

env -C build_clang_ninja_multi cpack -G TGZ -C Release
```

### Install
```
rm -rf installation_clang_ninja_multi &&
cmake --install build_clang_ninja_multi --config Release --prefix installation_clang_ninja_multi
```


# TODO
* Read Chapter 35, Installing, to move "install()" commands away from packaging/CMakeLists.txt
* Create several libs and use option() to disable subtrees. Use a common prefix
* Recommended practices:
    * Do NOT if/switch on CMAKE_BUILD_TYPE to add flags as it is only meaningful in single configuration generators.
    * Prefer to provide cache variables for controlling whether to enable optional parts of
     the build instead of encoding the logic in build scripts outside of CMake.
    * Avoid relying on environment variables being defined, apart from perhaps the ubiquitous
     PATH or similar operating system level variables. Therefore, prefer to pass information
     directly to CMake through cache variables instead wherever possible.
    * Try to establish a variable naming convention early. For cache variables, consider
     grouping related variables under a common prefix followed by an underscore.
    * Avoid defining non-cache variables in the project which have the same name as cache variables
    * Aim to minimize the amount of output at the STATUS log level, saving more detailed output for
     a log level of VERBOSE or lower. 
* 14.3. Print Helpers
* 14.4. Tracing Variable Access
* 14.5. Debugging Generator Expressions
* Use Conan and then 35.4. Installing Imported Targets
* Windows. MingGW. MSVC.

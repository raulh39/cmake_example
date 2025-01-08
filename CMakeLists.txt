# Recommended starting folders:
#   src: main code and unit tests for the project
#   cmake: helper cmake scripts
#   tests: end to end tests and similar
#   packaging: if packages needs to be created
#   doc: documentation of the project

# Recommended practice:
# Ensure every CMake project has a cmake_minimum_required() command as the first line of its top level CMakeLists.txt file
cmake_minimum_required(VERSION 3.30)

# Recommended practices:
# Incorporate VERSION as soon as possible to project()
# Specify the list of languages used
# Do NOT use a variable for the name of the project
project(cmake_examples VERSION 1.0 LANGUAGES CXX)

enable_testing()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# Recommended way to set C++ standard to use (see "cmake/set_cpp_version.cmake")
include(set_cpp_version)
# Recommended practice: hide all symbols in shared libs by default (see "cmake/visibility.cmake")
include(visibility)
# Recommended practice: set installation dirs and handle RPATH (see "cmake/install_options.cmake")
include(install_options)

# General recommended practice:
# Avoid hard-coding turning warnings into errors. Instead, the user can use
#     -DCMAKE_COMPILE_WARNING_AS_ERROR=YES (see "CMakePresets.json")


add_subdirectory(src)

if(PROJECT_IS_TOP_LEVEL)
    add_subdirectory(tests)
    add_subdirectory(packaging)
endif()

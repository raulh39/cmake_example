# Recommended practice:
# Ensure every CMake project has a cmake_minimum_required() command as the first line of its top level CMakeLists.txt file
cmake_minimum_required(VERSION 3.30)

# Recommended practices:
# Incorporate VERSION as soon as possible to project()
# Specify the list of languages used
# Do NOT use a variable for the name of the project
project(cmake_examples VERSION 1.0 LANGUAGES CXX)

enable_testing()

# Recommended way to set C++ standard to use (see "set_cpp_version.cmake")
include(cmake/set_cpp_version.cmake)

# General recommended practice:
# Avoid hard-coding turning warnings into errors. Instead, the user can use
#     -DCMAKE_COMPILE_WARNING_AS_ERROR=YES (probably in a preset)


add_subdirectory(awesome)

add_subdirectory(hello_world)

install(TARGETS hello_world awesome)
install(TARGETS awesome FILE_SET api)


# TODO:
# Presets. Add CMAKE_COMPILE_WARNING_AS_ERROR to one of them
# Recommended practices:
#   Do NOT use CMAKE_BUILD_TYPE to add flags as it is only meaningful in single configuration generators.
#   Prefer to provide cache variables for controlling whether to enable optional parts of
#     the build instead of encoding the logic in build scripts outside of CMake.
#   Avoid relying on environment variables being defined, apart from perhaps the ubiquitous
#     PATH or similar operating system level variables. Therefore, prefer to pass information
#     directly to CMake through cache variables instead wherever possible.
#   Try to establish a variable naming convention early. For cache variables, consider
#     grouping related variables under a common prefix followed by an underscore.
#   Avoid defining non-cache variables in the project which have the same name as cache variables
#   Aim to minimize the amount of output at the STATUS log level, saving more detailed output for
#     a log level of VERBOSE or lower. 

# 14.3. Print Helpers
# 14.4. Tracing Variable Access
# 14.5. Debugging Generator Expressions

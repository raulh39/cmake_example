# Recommended practice:
# Ensure every CMake project has a cmake_minimum_required() command as the first line of its top level CMakeLists.txt file
cmake_minimum_required(VERSION 3.30)

# Recommended practices:
# Incorporate VERSION as soon as possible to project()
# Specify the list of languages used
project(cmake_examples VERSION 1.0 LANGUAGES CXX)

add_executable(hello_world hello_world.cpp)

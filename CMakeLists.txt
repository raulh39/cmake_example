# Recommended practice:
# Ensure every CMake project has a cmake_minimum_required() command as the first line of its top level CMakeLists.txt file
cmake_minimum_required(VERSION 3.30)

# Recommended practices:
# Incorporate VERSION as soon as possible to project()
# Specify the list of languages used
# Do NOT use a variable for the name of the project
project(cmake_examples VERSION 1.0 LANGUAGES CXX)

enable_testing()

# Recommended practices:
# Do NOT use a variable for the name of the library
# Do NOT use "lib" in the name of the library
# Avoid specifying the STATIC or SHARED keyword for a library until it is known to be needed.
add_library(awesome)
target_sources(awesome PRIVATE awesome.cpp)
add_library(awesome::awesome ALIAS awesome)

# Recommended practice:
# Do NOT use a variable for the name of the executable
add_executable(hello_world hello_world.cpp)

# Recommended practice:
# Always specify PRIVATE, PUBLIC, or INTERFACE keywords
target_link_libraries(hello_world PUBLIC awesome::awesome)


add_executable(awesome_unit_tests awesome_unit_tests.cpp)
target_link_libraries(awesome_unit_tests PUBLIC awesome::awesome)
add_test(NAME AwesomeUnitTests COMMAND awesome_unit_tests)

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

# Recommended practice:
# Use target_sources to declare sources belonging to a target
target_sources(awesome PRIVATE awesome.cpp)

# Recommended practice:
# Use file sets to declare header files so that latter can be installed
target_sources(awesome
    PUBLIC
        FILE_SET api
        TYPE HEADERS
        BASE_DIRS .
        FILES
            awesome.h
            awesome_version.h
)

# Recommended practice:
# Use aliases for libraries
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


install(TARGETS hello_world awesome)
install(TARGETS awesome FILE_SET api)


# TODO:
# Recommended practices:
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

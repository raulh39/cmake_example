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

add_executable(awesome_unit_tests awesome_unit_tests.cpp)
target_link_libraries(awesome_unit_tests PUBLIC awesome::awesome)
add_test(NAME AwesomeUnitTests COMMAND awesome_unit_tests)

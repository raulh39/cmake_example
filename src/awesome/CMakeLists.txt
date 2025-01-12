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
# Avoid target_include_directories() to add any header search paths, since all
#   such paths should be handled by the BASE_DIRS
target_sources(awesome
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS .
        FILES
            awesome.h
            awesome_version.h
)

# Recommended practice:
# Use GenerateExportHeader to generate macro for symbols visibility
include(GenerateExportHeader)
generate_export_header(awesome)
target_sources(awesome
    PUBLIC
        FILE_SET HEADERS
        BASE_DIRS ${CMAKE_CURRENT_BINARY_DIR}
        FILES ${CMAKE_CURRENT_BINARY_DIR}/awesome_export.h
)

# Recommended practice:
# Use aliases for libraries
add_library(awesome::awesome ALIAS awesome)

find_package(GTest REQUIRED)
add_executable(awesome_unit_tests awesome_unit_tests.cpp)
target_link_libraries(awesome_unit_tests PUBLIC awesome::awesome GTest::gmock_main)
add_test(NAME AwesomeUnitTests COMMAND awesome_unit_tests)

install(TARGETS awesome)
install(TARGETS awesome FILE_SET HEADERS)

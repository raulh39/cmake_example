# Recommended practice:
# Do NOT use a variable for the name of the executable
add_executable(hello_world)

# Recommended practice:
# Always specify PRIVATE, PUBLIC, or INTERFACE keywords
target_sources(hello_world PRIVATE hello_world.cpp)

# Recommended practice:
# Always specify PRIVATE, PUBLIC, or INTERFACE keywords
target_link_libraries(hello_world PRIVATE awesome::awesome)

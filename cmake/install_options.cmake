# Recommended practice:
# Include GNUInstallDirs to set CMAKE_INSTALL_... variables to sensible defaults depending on the destination platform
# so that install() uses a good enough layout
include(GNUInstallDirs)

# Recommended practice:
# Set CMAKE_INSTALL_RPATH as, for example, both $ORIGIN and $ORIGIN/../lib so that _installed_ executables can find shared
# libs relative to where they are installed. "ldd" translates $ORIGIN to the location of the binary file.
# This should be done before the creation of any SHARED target as CMAKE_INSTALL_RPATH is used as initial value for target's
# INSTALL_RPATH property.
file(RELATIVE_PATH relDir
    ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_BINDIR}
    ${CMAKE_CURRENT_BINARY_DIR}/${CMAKE_INSTALL_LIBDIR}
)
set(CMAKE_INSTALL_RPATH $ORIGIN $ORIGIN/${relDir})

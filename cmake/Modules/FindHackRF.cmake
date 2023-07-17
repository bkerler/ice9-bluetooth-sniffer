# - Find LIBHACKRF
# Find the native HACKRF includes and library
# This module defines
#  LIBHACKRF_INCLUDE_DIR, where to find hackrf.h, etc.
#  LIBHACKRF_LIBRARIES, the libraries needed to use HACKRF.
#  LIBHACKRF_FOUND, If false, do not try to use HACKRF.
# also defined, but not for general use are
#  LIBHACKRF_LIBRARY, where to find the HACKRF library.

find_package(PkgConfig)
pkg_check_modules(PC_LIBHACKRF QUIET libhackrf)

FIND_PATH(LIBHACKRF_INCLUDE_DIR
    NAMES hackrf.h
    HINTS
        $ENV{LIBHACKRF_DIR}/include
        ${PC_LIBHACKRF_INCLUDEDIR}
        ${PC_LIBHACKRF_INCLUDE_DIRS}
        /opt/homebrew/include
        /opt/local/include
        /home/linuxbrew/.linuxbrew/include
        /usr/include
        /usr/local/include
     PATH_SUFFIXES libhackrf
)

FIND_LIBRARY(LIBHACKRF_LIBRARY
    NAMES hackrf
    HINTS
        $ENV{LIBHACKRF_DIR}/lib
        ${PC_LIBHACKRF_LIBDIR}
        ${PC_LIBHACKRF_LIBRARY_DIRS}
)

include(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(HackRF DEFAULT_MSG LIBHACKRF_LIBRARY LIBHACKRF_INCLUDE_DIR)

IF (LIBHACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)
    SET(LIBHACKRF_LIBRARIES ${LIBHACKRF_LIBRARY})
    SET(LIBHACKRF_FOUND "YES")
ELSE (LIBHACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)
    SET(LIBHACKRF_FOUND "NO")
ENDIF (LIBHACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)

IF (LIBHACKRF_FOUND)
    IF (NOT HACKRF_FIND_QUIETLY)
        MESSAGE(STATUS "Found HackRF: ${LIBHACKRF_LIBRARIES}")
    ENDIF (NOT HACKRF_FIND_QUIETLY)
ELSE (LIBHACKRF_FOUND)
    IF (HACKRF_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find HackRF library")
    ENDIF (HACKRF_FIND_REQUIRED)
ENDIF (LIBHACKRF_FOUND)

# Deprecated declarations.
GET_FILENAME_COMPONENT (NATIVE_LIBHACKRF_LIB_PATH ${LIBHACKRF_LIBRARY} PATH)

MARK_AS_ADVANCED(
        LIBHACKRF_LIBRARY
        LIBHACKRF_INCLUDE_DIR
)

set(LIBHACKRF_INCLUDE_DIRS ${LIBHACKRF_INCLUDE_DIR})
set(LIBHACKRF_LIBRARIES ${LIBHACKRF_LIBRARY})
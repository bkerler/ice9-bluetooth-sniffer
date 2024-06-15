# - Find HACKRF
# Find the native HACKRF includes and library
# This module defines
#  HACKRF_INCLUDE_DIR, where to find hackrf.h, etc.
#  HACKRF_LIBRARIES, the libraries needed to use HACKRF.
#  HACKRF_FOUND, If false, do not try to use HACKRF.
# also defined, but not for general use are
#  HACKRF_LIBRARY, where to find the HACKRF library.

FIND_PATH(HACKRF_INCLUDE_DIR hackrf.h
        ${HACKRF_DIR}/include/libhackrf
        /opt/homebrew/include/libhackrf
        /opt/local/include/libhackrf
        /home/linuxbrew/.linuxbrew/include/libhackrf
        /usr/include/libhackrf
        /usr/local/include/libhackrf
)

FIND_LIBRARY(HACKRF_LIBRARY hackrf)

IF (HACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)
    SET(HACKRF_LIBRARIES ${HACKRF_LIBRARY})
    SET(HACKRF_FOUND "YES")
ELSE (HACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)
    SET(HACKRF_FOUND "NO")
ENDIF (HACKRF_LIBRARY AND HACKRF_INCLUDE_DIR)

IF (HACKRF_FOUND)
    IF (NOT HACKRF_FIND_QUIETLY)
        MESSAGE(STATUS "Found HackRF: ${HACKRF_LIBRARIES}")
    ENDIF (NOT HACKRF_FIND_QUIETLY)
ELSE (HACKRF_FOUND)
    IF (HACKRF_FIND_REQUIRED)
        MESSAGE(FATAL_ERROR "Could not find HackRF library")
    ENDIF (HACKRF_FIND_REQUIRED)
ENDIF (HACKRF_FOUND)

# Deprecated declarations.
GET_FILENAME_COMPONENT (NATIVE_HACKRF_LIB_PATH ${HACKRF_LIBRARY} PATH)

MARK_AS_ADVANCED(
        HACKRF_LIBRARY
        HACKRF_INCLUDE_DIR
)

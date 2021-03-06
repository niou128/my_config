cmake_minimum_required(VERSION 3.5.1)
project(myconfigserver)

#################################################
# OPTIONS
#################################################

set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}/bin" CACHE PATH "Program install directory" FORCE)
set(RESTBED_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/lib/restbed/distribution/include" CACHE PATH "Restbed library include directory")
set(RESTBED_LIBRARY_DIR "${PROJECT_SOURCE_DIR}/lib/restbed/distribution/library" CACHE PATH "Restbed library binary directory")

#################################################
# Libraries
#################################################

# Restbed
find_library(RESTBED_LIB restbed PATHS ${RESTBED_LIBRARY_DIR})
include_directories(SYSTEM ${RESTBED_INCLUDE_DIR})

# SimpleJSON
add_subdirectory(lib/simplejson)

# UTF8
include_directories(lib/utf8)

#################################################
# Compiling
#################################################

if(WIN32)

  set(CMAKE_CXX_FLAGS "/D_WIN32 /DWIN32 /D_WINDOWS /EHsc /W3")
  set(CMAKE_CXX_FLAGS_DEBUG "/MDd")
  set(CMAKE_CXX_FLAGS_RELEASE "/MD")
  add_executable(
    ${PROJECT_NAME}

    header/cpu.h
    header/cpuwin.hpp
    header/hdd.h
    header/header.h
    header/memory.h
    header/memorywin.hpp
    header/os.h
    header/webservice.h
    header/windowsos.hpp
    header/winhdd.hpp

    src/cpu.cpp
    src/cpuwin.cpp
    src/hdd.cpp
    src/main.cpp
    src/memory.cpp
    src/memorywin.cpp
    src/os.cpp
    src/webservice.cpp
    src/windowsos.cpp
    src/winhdd.cpp
  )

elseif(APPLE)

  set(CMAKE_CXX_FLAGS "-std=c++11")
  add_executable(
    ${PROJECT_NAME}

    header/cpu.h
    header/cpumac.hpp
    header/hdd.h
    header/header.h
    header/macos.hpp
    header/machdd.hpp
    header/memory.h
    header/memorymac.hpp
    header/os.h
    header/webservice.h

    src/cpu.cpp
    src/cpumac.cpp
    src/hdd.cpp
    src/macos.cpp
    src/machdd.cpp
    src/main.cpp
    src/memory.cpp
    src/memorymac.cpp
    src/os.cpp
    src/webservice.cpp
  )

else(UNIX)

  set(CMAKE_CXX_FLAGS "-std=c++11")
  add_executable(
    ${PROJECT_NAME}

    header/command.h
    header/cpu.h
    header/cpulinux.hpp
    header/hdd.h
    header/header.h
    header/linuxhdd.hpp
    header/linuxos.hpp
    header/memory.h
    header/memorylinux.hpp
    header/os.h
    header/webservice.h

    src/command.cpp
    src/cpu.cpp
    src/cpulinux.cpp
    src/hdd.cpp
    src/linuxhdd.cpp
    src/linuxos.cpp
    src/main.cpp
    src/memory.cpp
    src/memorylinux.cpp
    src/os.cpp
    src/webservice.cpp
  )

endif()

#################################################
# LINKING
#################################################

target_link_libraries(${PROJECT_NAME} ${RESTBED_LIB})
target_link_libraries(${PROJECT_NAME} simplejson)

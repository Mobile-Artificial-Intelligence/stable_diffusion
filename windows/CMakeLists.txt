# The Flutter tooling requires that developers have a version of Visual Studio
# installed that includes CMake 3.14 or later. You should not increase this
# version, as doing so will cause the plugin to fail to compile for some
# customers of the plugin.
cmake_minimum_required(VERSION 3.14)

# Project-level configuration.
set(PROJECT_NAME "sdcpp")
project(${PROJECT_NAME} LANGUAGES CXX)

set(API_DIR ${CMAKE_CURRENT_SOURCE_DIR}/../src)
set(STABLE_DIFFUSION_CPP_DIR ${API_DIR}/stable_diffusion)

# Build the shared libs
set(SD_BUILD_SHARED_LIBS ON CACHE BOOL "Build shared libraries" FORCE)
set(CMAKE_INSTALL_LIBDIR lib CACHE PATH "library install dir" FORCE)

# Invoke the build for native code shared with the other target platforms.
# This can be changed to accommodate different builds.
add_subdirectory("${STABLE_DIFFUSION_CPP_DIR}" "${CMAKE_CURRENT_BINARY_DIR}/shared")

target_sources(
  stable-diffusion
  PRIVATE
  ${API_DIR}/api.cpp
)

set_target_properties(
  stable-diffusion 
  PROPERTIES
  PUBLIC_HEADER ${API_DIR}/api.h
  BUILD_WITH_INSTALL_RPATH TRUE
  INSTALL_RPATH "$ORIGIN"
)

# List of absolute paths to libraries that should be bundled with the plugin.
# This list could contain prebuilt libraries, or libraries created by an
# external build triggered from this build file.
set(sdcpp_bundled_libraries
  # Defined in ../src/CMakeLists.txt.
  # This can be changed to accommodate different builds.
  $<TARGET_FILE:stable-diffusion>
  PARENT_SCOPE
)

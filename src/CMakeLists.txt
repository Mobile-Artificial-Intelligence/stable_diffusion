# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(stable_diffusion_library VERSION 0.0.1 LANGUAGES C)

add_library(stable_diffusion SHARED
  "stable_diffusion.c"
)

set_target_properties(stable_diffusion PROPERTIES
  PUBLIC_HEADER stable_diffusion.h
  OUTPUT_NAME "stable_diffusion"
)

target_compile_definitions(stable_diffusion PUBLIC DART_SHARED_LIB)

if (ANDROID)
  # Support Android 15 16k page size
  target_link_options(stable_diffusion PRIVATE "-Wl,-z,max-page-size=16384")
endif()

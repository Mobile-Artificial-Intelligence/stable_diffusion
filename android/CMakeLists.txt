cmake_minimum_required(VERSION 3.22)

# Define the project
project(sdcpp)

# Set CMake flags
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DBUILD_COMMIT=unknown -DBUILD_COMPILER=unknown -DBUILD_TARGET=Android")
add_link_options("LINKER:--hash-style=gnu,--build-id=none")

set(API_DIR ../src)
set(STABLE_DIFFUSION_DIR ${API_DIR}/stable_diffusion)

# Add subdirectory with explicit source and binary directories
add_subdirectory(${STABLE_DIFFUSION_DIR} ${CMAKE_BINARY_DIR}/stable_diffusion_build)

target_sources(
  stable-diffusion 
  PRIVATE 
  ${API_DIR}/api.cpp
)
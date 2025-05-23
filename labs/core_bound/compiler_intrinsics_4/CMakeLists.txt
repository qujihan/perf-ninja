cmake_minimum_required(VERSION 4.0.0)

project(lab)

set(CMAKE_CXX_STANDARD 20)
# -ffast-math is disabled for validation purposes; it doesn't help compiler to autovectorize the code.
set(DISABLE_FAST_MATH 1)

set(LAB_DATA_PATH "${CMAKE_CURRENT_SOURCE_DIR}/data")
# Create the directory if it does not exist
file(MAKE_DIRECTORY ${LAB_DATA_PATH})
cmake_path(SET VALIDATION_IMAGE_PATH "${LAB_DATA_PATH}/validation_user.ppm")
cmake_path(SET REFERENCE_IMAGE_PATH "${LAB_DATA_PATH}/validation_reference.ppm")
cmake_path(SET BENCHMARK_IMAGE_PATH "${LAB_DATA_PATH}/benchmark_output.ppm")
configure_file(data_paths.h.in "${CMAKE_CURRENT_BINARY_DIR}/data_paths.h")

include_directories(${CMAKE_CURRENT_BINARY_DIR})

string(REGEX MATCH "^(.*)[\\/]labs[\\/].*$" repo "${CMAKE_CURRENT_SOURCE_DIR}")
include(${CMAKE_MATCH_1}/tools/labs.cmake)

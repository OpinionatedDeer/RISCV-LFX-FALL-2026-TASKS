cmake_minimum_required(VERSION 3.20)

project(SimplePass)

find_package(LLVM REQUIRED CONFIG)

message(STATUS "Found LLVM ${LLVM_PACKAGE_VERSION}")

include_directories(${LLVM_INCLUDE_DIRS})
add_definitions(${LLVM_DEFINITIONS})

add_library(SimplePass SHARED
    SimplePass.cpp
)

target_link_directories(SimplePass PRIVATE ${LLVM_LIBRARY_DIRS})

target_link_libraries(SimplePass PRIVATE LLVM-22)

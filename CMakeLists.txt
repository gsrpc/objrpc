cmake_minimum_required(VERSION 3.2)

PROJECT(objrpc)

INCLUDE_DIRECTORIES(src)

FILE(GLOB_RECURSE SRCFILES src/*.m)

FILE(GLOB_RECURSE INCLUDEFILES src/*.h)

INCLUDE_DIRECTORIES(src test)

ADD_LIBRARY(
    objrpc
    SHARED
    ${SRCFILES} ${INCLUDEFILES})

MESSAGE(${INCLUDEFILES})

set_target_properties(
    objrpc PROPERTIES
    FRAMEWORK TRUE
    FRAMEWORK_VERSION 1.0.0
    PUBLIC_HEADER "${INCLUDEFILES}"
)


FILE(GLOB_RECURSE SRCFILES test/*.m)

FILE(GLOB_RECURSE INCLUDEFILES test/*.h)

add_executable(
    "objrpc-test"
${SRCFILES} ${INCLUDEFILES} test/main.m)

target_compile_features("objrpc-test" PUBLIC cxx_strong_enums)

add_dependencies("objrpc-test" objrpc)

target_link_libraries("objrpc-test" objrpc)

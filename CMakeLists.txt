cmake_minimum_required(VERSION 3.22)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bluenrg-gcc.cmake)

set(PROJECT_COMPILE_DEFINITIONS
    BLUENRG2_DEVICE
    HS_SPEED_XTAL=HS_SPEED_XTAL_32MHZ 
    LS_SOURCE=LS_SOURCE_INTERNAL_RO
    SMPS_INDUCTOR=SMPS_INDUCTOR_NONE
    )

set(PROJECT_LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/ld/BlueNRG2.ld)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
find_package(BlueNRG REQUIRED)

project(bluenrg-cmake
    VERSION 0.0.1
    DESCRIPTION "A template for the BlueNRG1(2) with GNU ARM and CMake"
    LANGUAGES C ASM)

add_executable(${CMAKE_PROJECT_NAME}
    src/main.c
    src/syscalls.c
    src/BlueNRG1_it.c
    )

target_compile_definitions(${CMAKE_PROJECT_NAME}
    PUBLIC
        ${PROJECT_COMPILE_DEFINITIONS}
    )

target_include_directories(${CMAKE_PROJECT_NAME}
    PUBLIC
        inc
    )

target_link_libraries(${CMAKE_PROJECT_NAME} 
    PUBLIC
        bluenrg_periph
    )

target_link_options(${CMAKE_PROJECT_NAME}
    PUBLIC
        -T${PROJECT_LINKER_SCRIPT}
    )

add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} --format=berkeley --totals "$<TARGET_FILE:${CMAKE_PROJECT_NAME}>"
    )
    
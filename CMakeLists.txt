cmake_minimum_required(VERSION 3.22)

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bluenrglp-gcc.cmake)

set(PROJECT_COMPILE_DEFINITIONS
    STEVAL_IDB011V1
    CONFIG_DEVICE_BLUENRG_LP
    CONFIG_HW_SMPS_10uH
    CONFIG_HW_HSE_TUNE=32
    CONFIG_HW_LS_XTAL
    )

set(PROJECT_LINKER_SCRIPT ${CMAKE_CURRENT_SOURCE_DIR}/ld/BlueNRG_LP.ld)

set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/cmake)
find_package(BlueNRGLP REQUIRED)

project(bluenrg-cmake
    VERSION 0.0.1
    DESCRIPTION "A template for the BlueNRG-LP(S) with GNU ARM and CMake"
    LANGUAGES C ASM)

add_executable(${CMAKE_PROJECT_NAME}
    src/main.c
    src/syscalls.c
    src/rf_device_hal_msp.c
    src/rf_device_it.c
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
        bluenrglp_periph_hal
    )

target_link_options(${CMAKE_PROJECT_NAME}
    PUBLIC
        -T${PROJECT_LINKER_SCRIPT}
    )

add_custom_command(TARGET ${CMAKE_PROJECT_NAME} POST_BUILD
    COMMAND ${CMAKE_SIZE} --format=berkeley --totals "$<TARGET_FILE:${CMAKE_PROJECT_NAME}>"
    )
    
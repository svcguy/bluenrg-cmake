# BlueNRG CMake Madness... let's go...
set(BLUENRG_SDK_ROOT "/Users/andy/Code/BlueNRG-1_2 DK 3.2.2")

set(BLUENRG_SDK_LIB ${BLUENRG_SDK_ROOT}/Library)
set(BLUENRG_SDK_EXAMPLES ${BLUENRG_SDK_ROOT}/Project)

##################################
#                                #
#   bluenrg_periph               #
#                                #
#   This will include the        #
#   peripheral library code and  #
#   the HAL code                 #
#                                #
##################################
add_library(bluenrg_periph STATIC)

target_sources(bluenrg_periph PRIVATE
    # CMSIS
    ${BLUENRG_SDK_LIB}/CMSIS/Device/ST/BlueNRG1/Source/system_BlueNRG1.c
    # Peripheral Drivers
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_adc.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_dma.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_flash.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_gpio.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_i2c.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_mft.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_pka.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_radio.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_rng.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_rtc.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_spi.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_sysCtrl.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_timer.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_uart.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/BlueNRG1_wdg.c
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/src/misc.c
    # HAL
    ${BLUENRG_SDK_LIB}/hal/src/clock.c
    ${BLUENRG_SDK_LIB}/hal/src/context_switch.s
    ${BLUENRG_SDK_LIB}/hal/src/fifo.c
    ${BLUENRG_SDK_LIB}/hal/src/gp_timer.c
    ${BLUENRG_SDK_LIB}/hal/src/hal_radio.c
    ${BLUENRG_SDK_LIB}/hal/src/miscutil.c
    ${BLUENRG_SDK_LIB}/hal/src/osal.c
    ${BLUENRG_SDK_LIB}/hal/src/radio_ota.c
    ${BLUENRG_SDK_LIB}/hal/src/sleep.c
    ${BLUENRG_SDK_LIB}/hal/src/vtimer.c
    )

target_include_directories(bluenrg_periph PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${BLUENRG_SDK_LIB}/CMSIS/Device/ST/BlueNRG1/Include
    ${BLUENRG_SDK_LIB}/CMSIS/Include
    ${BLUENRG_SDK_LIB}/BlueNRG1_Periph_Driver/inc
    ${BLUENRG_SDK_LIB}/hal/inc
    )

target_compile_definitions(bluenrg_periph PUBLIC
    ${PROJECT_COMPILE_DEFINITIONS}
    )

##################################
#                                #
#   bluenrg_freertos             #
#                                #
#   This will include code       #
#   necessary to get FreeRTOS    #
#   running                      #
#                                #
##################################
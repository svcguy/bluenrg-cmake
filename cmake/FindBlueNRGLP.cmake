# BlueNRGLP CMake Madness... let's go...
set(BLUENRG_SDK_ROOT "/Users/andy/Code/BlueNRG-LP_LPS-DK-1.2.0")

set(BLUENRG_SDK_CMSIS "${BLUENRG_SDK_ROOT}/Drivers/CMSIS")
set(BLUENRG_SDK_PERIPH "${BLUENRG_SDK_ROOT}/Drivers/Peripherals_Drivers")
set(BLUENRG_SDK_HAL "${BLUENRG_SDK_ROOT}/Middlewares/ST")

#############################
#                           #
#  Peripheral Drivers and   #
#  CMSIS                    #
#                           #
#  This will include the    #
#  peripheral library and   #
#  CMSIS device files       #
#                           #
#############################

add_library(bluenrglp_periph_ll STATIC)

target_sources(bluenrglp_periph_ll PRIVATE
    # CMSIS
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Source/startup_BlueNRG_LP.c
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Source/system_BlueNRG_LP.c
    # Periph LL
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_adc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_assert.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_crc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_dma.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_exti.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_flash.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_gpio.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_i2c.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_lpuart.c
    # BLUENRG_LP
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_pka_v7b.c
    # BLUENRG_LPS
    # TODO: CHOOSE CORRECT ll_pka source file
    #${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_pka_v7c.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_pwr.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_radio_2g4.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_rcc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_rng.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_rtc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_spi.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_tim.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_timer.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_usart.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_ll_utils.c
    )

target_include_directories(bluenrglp_periph_ll PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${BLUENRG_SDK_CMSIS}/Include
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Include
    ${BLUENRG_SDK_PERIPH}/Inc
    # Startup code depends on system_util.h from hal
    ${BLUENRG_SDK_HAL}/hal/Inc
    )

target_compile_definitions(bluenrglp_periph_ll PUBLIC
    ${PROJECT_COMPILE_DEFINITIONS}
    USE_FULL_LL_DRIVER
    )

add_library(bluenrglp_periph_hal STATIC)

target_sources(bluenrglp_periph_hal PRIVATE
    # CMSIS
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Source/startup_BlueNRG_LP.c
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Source/system_BlueNRG_LP.c
    # Periph HAL
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_adc_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_adc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_cortex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_crc_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_crc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_dma.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_exti.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_flash_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_flash.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_gpio.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_i2c_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_i2c.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_i2s.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_irda.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_iwdg.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_microphone.c
    # BLUENRG_LP
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_pka_v7b.c
    # BLUENRG_LPS
    # TODO: CHOOSE CORRECT hal_pka source file
    #${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_pka_v7c.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_power_manager.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_pwr_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_pwr.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_radio_2g4.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_rcc_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_rcc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_rtc_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_rtc.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_smartcard_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_smartcard.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_smbus.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_spi_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_spi.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_tim_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_tim.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_uart_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_uart.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_usart_ex.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_usart.c
    ${BLUENRG_SDK_PERIPH}/Src/rf_driver_hal_vtimer.c
    )

target_include_directories(bluenrglp_periph_hal PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/inc
    ${BLUENRG_SDK_CMSIS}/Include
    ${BLUENRG_SDK_CMSIS}/Device/ST/BlueNRG_LP/Include
    ${BLUENRG_SDK_PERIPH}/Inc
    # Startup code depends on system_util.h from hal
    ${BLUENRG_SDK_HAL}/hal/Inc
    )

target_compile_definitions(bluenrglp_periph_hal PUBLIC
    ${PROJECT_COMPILE_DEFINITIONS}
    USE_HAL_DRIVER
    )
# CMake File for building the BlueNRG(1,2) Library with GCC
set(TOOLCHAIN_PATH /Applications/ARM)
set(BLUENRG_TARGET_TRIPLET arm-none-eabi)

set(TOOLCHAIN_SYSROOT  ${TOOLCHAIN_PATH}/${BLUENRG_TARGET_TRIPLET})
set(TOOLCHAIN_BIN_PATH ${TOOLCHAIN_PATH}/bin)
set(TOOLCHAIN_INC_PATH ${TOOLCHAIN_PATH}/${BLUENRG_TARGET_TRIPLET}/include)
set(TOOLCHAIN_LIB_PATH ${TOOLCHAIN_PATH}/${BLUENRG_TARGET_TRIPLET}/lib)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR arm)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

find_program(CMAKE_C_COMPILER NAMES ${BLUENRG_TARGET_TRIPLET}-gcc HINTS ${TOOLCHAIN_BIN_PATH})
find_program(CMAKE_ASM_COMPILER NAMES ${BLUENRG_TARGET_TRIPLET}-gcc HINTS ${TOOLCHAIN_BIN_PATH})
find_program(CMAKE_OBJCOPY NAMES ${BLUENRG_TARGET_TRIPLET}-objcopy HINTS ${TOOLCHAIN_BIN_PATH})
find_program(CMAKE_OBJDUMP NAMES ${BLUENRG_TARGET_TRIPLET}-objdump HINTS ${TOOLCHAIN_BIN_PATH})
find_program(CMAKE_SIZE NAMES ${BLUENRG_TARGET_TRIPLET}-size HINTS ${TOOLCHAIN_BIN_PATH})
find_program(CMAKE_DEBUGGER NAMES ${BLUENRG_TARGET_TRIPLET}-gdb HINTS ${TOOLCHAIN_BIN_PATH})

set(CMAKE_EXECUTABLE_SUFFIX_C .elf)
set(CMAKE_EXECUTABLE_SUFFIX_ASM .elf)

set(CMAKE_C_FLAGS "-mcpu=cortex-m0 -mthumb -mfloat-abi=soft -ffunction-sections -fdata-sections -Wall")
set(CMAKE_ASM_FLAGS "-mcpu=cortex-m0 -mthumb -mfloat-abi=soft -x assembler-with-cpp")
set(CMAKE_EXE_LINKER_FLAGS "-mcpu=cortex-m0 -mthumb -mfloat-abi=soft -nostartfiles -nodefaultlibs --specs=nano.specs -Wl,--print-memory-usage -Wl,-Map=${CMAKE_PROJECT_NAME}.map -Wl,--cref -Wl,--gc-sections -Wl,--start-group -lm -lc -Wl,--end-group")
    
cmake_minimum_required(VERSION 3.16)

# Nombre del proyecto
project(UEFIApp LANGUAGES C)

# Define el estándar C
set(CMAKE_C_STANDARD 11)
set(CMAKE_C_STANDARD_REQUIRED ON)

# Ruta al directorio de MdePkg
set(EDK2_PATH "${CMAKE_SOURCE_DIR}/MdePkg")

# Agregar definiciones específicas para UEFI
add_definitions(-fshort-wchar -ffreestanding -fno-stack-protector -fno-exceptions)

# Incluye las rutas de cabeceras UEFI
include_directories(
    ${EDK2_PATH}/Include
    ${EDK2_PATH}/Include/X64
)

# Archivos fuente
set(SOURCES
    ${CMAKE_SOURCE_DIR}/src/main.c
)

# Crea el ejecutable
add_executable(UEFIApp ${SOURCES})

# Configurar el tipo de binario como un ejecutable UEFI
set_target_properties(UEFIApp PROPERTIES
    OUTPUT_NAME "UEFIApp"
    SUFFIX ".efi"
    LINK_FLAGS "-nostdlib -Wl,-T,${CMAKE_SOURCE_DIR}/linker.ld -Wl,--no-undefined -Wl,-Bsymbolic"
)

# Enlazar con las bibliotecas de UEFI
target_link_libraries(UEFIApp
    -L/usr/lib
    -lefi -lgnuefi
)

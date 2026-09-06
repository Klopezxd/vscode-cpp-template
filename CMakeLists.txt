cmake_minimum_required(VERSION 3.20)

project(Template_C_Cpp LANGUAGES C CXX)

# Configuración de estándares modernos
set(CMAKE_C_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Genera compile_commands.json para IntelliSense automático
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Directorio de salida del ejecutable final (en bin/)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR}/bin)

# Incluye la carpeta include/ automáticamente si existe
if(EXISTS "${CMAKE_SOURCE_DIR}/include")
    include_directories("${CMAKE_SOURCE_DIR}/include")
endif()

# Detección automática de archivos fuente en src/
file(GLOB_RECURSE SOURCES
    "${CMAKE_SOURCE_DIR}/src/*.c"
    "${CMAKE_SOURCE_DIR}/src/*.cpp"
)

# Soporte flexible: detecta también archivos fuente colocados en la raíz
file(GLOB ROOT_SOURCES
    "${CMAKE_SOURCE_DIR}/*.c"
    "${CMAKE_SOURCE_DIR}/*.cpp"
)
list(APPEND SOURCES ${ROOT_SOURCES})

# Validación de fuentes
if(NOT SOURCES)
    message(WARNING "No se encontraron archivos .c o .cpp en src/ ni en la raíz. Agrega un archivo para compilar.")
else()
    add_executable(main ${SOURCES})
endif()

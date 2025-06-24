# Detecta el compilador mingw64 si existe, si no usa el del sistema
CC=$(shell if exist mingw64\bin\gcc.exe (echo mingw64\bin\gcc.exe) else (echo gcc))
CXX=$(shell if exist mingw64\bin\g++.exe (echo mingw64\bin\g++.exe) else (echo g++))

SRC_DIR=src
OBJ_DIR=bin
INCLUDE_DIR=include

# Detecta archivos .c y .cpp en src
C_SOURCES=$(wildcard $(SRC_DIR)/*.c)
CPP_SOURCES=$(wildcard $(SRC_DIR)/*.cpp)

# Selecciona qué fuentes usar y qué compilador según existan .cpp o no
ifeq ($(strip $(CPP_SOURCES)),)
    SOURCES=$(C_SOURCES)
    COMPILER=$(CC)
else
    SOURCES=$(CPP_SOURCES)
    COMPILER=$(CXX)
endif

EXECUTABLE=$(OBJ_DIR)/main.exe

# Regla all: primero crea bin, luego compila
all: $(OBJ_DIR) $(EXECUTABLE)

# Crea carpeta bin si no existe (Windows)
$(OBJ_DIR):
	if not exist $(OBJ_DIR) mkdir $(OBJ_DIR)

# Compila los archivos fuente con includes
$(EXECUTABLE): $(SOURCES)
	$(COMPILER) -I$(INCLUDE_DIR) -g $(SOURCES) -o $(EXECUTABLE)

# Limpia los ejecutables generados
clean:
	if exist $(OBJ_DIR)\*.exe del /Q $(OBJ_DIR)\*.exe

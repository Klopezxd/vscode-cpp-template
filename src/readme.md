# 📂 Carpeta `src`

Coloca aquí tus archivos fuente en **C** o **C++** (`.c` o `.cpp`).

### 1. Modo Simple (Un solo archivo)
Si estás haciendo un script rápido, algoritmo o prueba de concepto, solo necesitas un archivo aquí (por ejemplo, `main.cpp` o `main.c`). El sistema compila y genera el ejecutable directamente.

### 2. Modo Modular (Varios archivos)
Si tu proyecto tiene múltiples módulos (funciones auxiliares, clases, estructuras):
* Guarda las implementaciones (`.cpp` o `.c`) aquí en `src/`.
* Guarda las cabeceras (`.hpp` o `.h`) en la carpeta `include/`.

CMake detecta y enlaza automáticamente todos los archivos presentes en esta carpeta.

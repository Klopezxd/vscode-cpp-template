# Plantilla Portable para C / C++ en VS Code (Windows)

Esta plantilla te permite compilar y ejecutar programas en C y C++ con VS Code en Windows, usando un compilador MinGW portátil incluido en el proyecto (o descargado aparte).

---

## 📦 Estructura del proyecto

```
C_C++_VSCode_Template/
├─ .vscode/           # Configuraciones para VS Code (tareas, launch)
├─ bin/               # Ejecutables compilados (se crea automáticamente)
├─ include/           # Archivos headers (.h)
├─ mingw64/           # Compilador portable MinGW (no incluido en repo, descárgalo)
├─ src/               # Código fuente (.c y .cpp)
├─ Makefile           # Archivo para compilar con mingw32-make
└─ README.md
```

---

## ⚙️ Instalación del compilador portable (MinGW-w64)

Por motivos de tamaño, **no incluimos la carpeta `mingw64/` con el compilador en este repositorio**.
Sigue estos pasos para descargarlo y usarlo:

1. Ve al sitio de [WinLibs](https://winlibs.com/), donde están las versiones portables más recientes.

2. Descarga esta versión recomendada o una versión superior si está disponible:

   **Versión en inglés:**
   - *Release versions*
   - *UCRT runtime*
   - **GCC 15.1.0 (with POSIX threads) + MinGW-w64 13.0.0 UCRT - release 2 (LATEST)**
   - *Win64 (without LLVM/Clang/LLD/LLDB): Zip archive*

   **Versión en español:**
   - *Versiones de lanzamiento*
   - *Tiempo de ejecución de UCRT*
   - **GCC 15.1.0 (con subprocesos POSIX) + MinGW-w64 13.0.0 UCRT - versión 2 (ÚLTIMA)**
   - *Win64 (sin LLVM/Clang/LLD/LLDB): Archivo Zip*

   > ⚠️ **Puedes usar esta versión o cualquier otra igual o superior, siempre que tenga soporte UCRT y esté basada en POSIX threads (no MCF).**

3. Descomprime el archivo ZIP descargado.

4. Copia la carpeta descomprimida y renómbrala como `mingw64` en la raíz de este proyecto.

---

## 🚀 Cómo compilar y ejecutar

- La carpeta `bin/` donde se guarda el ejecutable se crea automáticamente al compilar (si es que no existe).
- El Makefile detecta si hay archivos `.c` o `.cpp` en la carpeta `src/` y usa el compilador correcto.
- Abre la carpeta del proyecto en VS Code.

### Atajos de teclado para tareas en VS Code

- **Compilar:** `Ctrl + Shift + B`
- **Ejecutar:** `Ctrl + Alt + R`
- **Limpiar (clean):** `Ctrl + Alt + C`

> Si no tienes asignados estos atajos, agrega estas configuraciones en tu archivo `keybindings.json` (abre paleta de comandos → "Preferences: Open Keyboard Shortcuts (JSON)"):

```json
[
  {
    "key": "ctrl+alt+r",
    "command": "workbench.action.tasks.runTask",
    "args": "Ejecutar programa"
  },
  {
    "key": "ctrl+alt+c",
    "command": "workbench.action.tasks.runTask",
    "args": "Clean"
  }
]
```

### Ejecutar manualmente en la terminal integrada

Si quieres ejecutar el programa manualmente:

```bash
.\bin\main.exe
```

## 🧹 Limpiar archivos compilados

Para borrar los ejecutables generados desde la terminal:

```bash
mingw32-make clean
```

O ejecuta la tarea "Clean" desde VS Code (`Ctrl + Alt + C`).

---

## 📝 Notas importantes

- Mantén la estructura de carpetas para que las rutas relativas funcionen.
- Agrega más archivos `.c` o `.cpp` en `src/` si deseas.
- Los headers van en `include/` y el Makefile los incluye automáticamente.

**¿Dudas o sugerencias?** ¡Abre un issue en GitHub!
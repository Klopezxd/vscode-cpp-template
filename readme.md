# Plantilla Moderna y Rápida para C / C++ en VS Code (Windows)

Plantilla lista para usar en proyectos de **C** y **C++** sobre Windows con **VS Code**. Diseñada para eliminar el tiempo perdido en configuraciones manuales: compila tanto ejercicios simples de un solo archivo como proyectos modulares complejos mediante **CMake**, **Ninja** y **Scoop**.

---

## 🚀 Inicio Rápido (Setup en 3 minutos)

Si estás en una computadora nueva o formateada, abre **PowerShell** (no necesitas permisos de Administrador) y ejecuta:

### 1. Instalar Scoop (si aún no lo tienes)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### 2. Instalar Compilador y Herramientas
Instala GCC (con soporte UCRT y POSIX threads), CMake y el compilador ultrarrápido Ninja en un solo comando:
```powershell
scoop install mingw-winlibs cmake ninja
```

### 3. Extensiones recomendadas en VS Code
Instala las extensiones oficiales desde el panel `Ctrl + Shift + X`:
* **C/C++** (`ms-vscode.cpptools`) — IntelliSense y depuración.
* **CMake Tools** (`ms-vscode.cmake-tools`) — Integración de compilación y ejecución directa.

---

## 📋 Cómo crear un NUEVO proyecto con esta plantilla

Para iniciar un proyecto nuevo en tu equipo, tienes dos opciones:

### Opción 1: Clonar o usar como Plantilla en GitHub (Recomendado)
1. En GitHub, haz clic en el botón verde **"Use this template"** -> **"Create a new repository"**.
2. Clona tu nuevo repositorio y ábrelo en VS Code.

### Opción 2: Copiar los archivos a una carpeta limpia
Si vas a crear una carpeta nueva manualmente en tu PC (por ejemplo `C:\Proyectos\MiTarea`), asegúrate de **copiar estos archivos esenciales** desde esta plantilla:

```text
MiTarea/
├── .vscode/               <-- Contiene settings.json, launch.json y extensions.json
├── src/                   <-- Pon aquí tu main.cpp o ejercicio.c
├── CMakeLists.txt         <-- El cerebro de la compilación
└── .gitignore             <-- Para no subir basura a git
```

---

## ⚙️ Primera apertura en VS Code (Paso único)

Al abrir tu carpeta de proyecto por primera vez en VS Code:

1. Presiona **`Ctrl + Shift + P`** y escribe:
   ```text
   CMake: Configurar
   ```
2. Te pedirá seleccionar un kit (compilador): elige **`GCC ... x86_64-w64-mingw32`**.
   *(Si la lista estuviera vacía, dale a `[Buscar kits]` / `[Scan for kits]` y lo detectará).*
3. ¡Listo! CMake Tools configurará el proyecto en milisegundos y no volverá a pedírtelo en esa carpeta.

---

## 📁 Estructuras de Proyecto Compatibles

Esta plantilla se adapta automáticamente sin tocar el `CMakeLists.txt`:

### Modo Simple (Un solo archivo)
Ideal para pruebas de concepto, algoritmos, scripts rápidos o programas de un solo archivo:
```
MiProyecto/
├── src/
│   └── main.cpp (o main.c / ejercicio.cpp)
├── .vscode/
└── CMakeLists.txt
```
* Simplemente coloca tu código en `src/main.cpp` (o en la raíz del proyecto).
* No necesitas crear carpetas adicionales ni modificar configuraciones.

### Modo Modular (Proyectos completos)
Ideal para proyectos más grandes, estructuras de datos o librerías:
```
MiProyecto/
├── include/           # Archivos de cabecera (.h / .hpp)
├── src/               # Implementaciones (.c / .cpp)
│   └── main.cpp
├── bin/               # Ejecutable final (main.exe)
├── build/             # Archivos intermedios de CMake (ignorado por Git)
├── CMakeLists.txt     # Script de construcción universal
└── README.md
```
* Coloca las cabeceras en `include/` y las fuentes en `src/`.
* `CMakeLists.txt` detecta y enlaza todos los archivos automáticamente.

---

## 📝 Cómo agregar nuevos archivos (Flujo de trabajo)

* **Archivos de código (`.cpp` o `.c`):**
  * Guárdalos siempre dentro de la carpeta **`src/`**.
  * `CMakeLists.txt` los detecta automáticamente. No necesitas editar ningún archivo de configuración: solo crea el archivo, guarda y compila (`F7`).
* **Archivos de cabecera (`.h` o `.hpp`):**
  * Guárdalos dentro de la carpeta **`include/`**.
  * Para usarlos desde cualquier archivo en `src/`, simplemente escribe `#include "mi_cabecera.h"`. CMake ya tiene la ruta configurada, así que no hace falta escribir rutas relativas complejas.
  * *(Nota: si por comodidad guardas un `.h` dentro de `src/`, también funcionará, pero tenerlos en `include/` es la buena práctica recomendada).*
* ⚠️ **Regla importante sobre `main()`:**
  * En C/C++ solo puede haber **una única función `main()`** por proyecto compilado.
  * Si estás creando diferentes programas o pruebas sueltas, mantén solo un archivo con `main()` activo a la vez (o comenta la función `main()` de los demás) para evitar errores de duplicación al compilar.

---

## ⌨️ Cómo Compilar y Ejecutar

### 1. Desde la Barra Inferior de VS Code (Recomendado)
En la **barra de estado inferior** (al fondo de tu pantalla) verás los controles directos de CMake:

* **Compilar:** Presiona la tecla **`F7`** o haz clic en el botón **`⚙ Compilación`** de la barra inferior.
* **Ejecutar:** Haz clic en el botón **`▷` (Play)** que está justo al lado del ícono de compilación en la barra inferior (o presiona `Ctrl + Shift + F5`).
* **Depurar (Debugger GDB):** Presiona **`F5`** *(la ventana se pausará automáticamente al inicio de `main()` para que puedas inspeccionar tu código sin que se cierre)*.
* **Limpiar proyecto:** Abre la paleta de comandos (`Ctrl + Shift + P`) y escribe `CMake: Clean Rebuild`.

### Desde la Terminal (PowerShell)
Si prefieres compilar y ejecutar mediante comandos, asegúrate de estar ubicado en la **carpeta raíz del proyecto**:
* **En VS Code:** Abre la terminal integrada con **`Ctrl + ñ`** (o desde el menú superior: *Terminal -> Nuevo terminal* / Paleta `Ctrl + Shift + P`), que se posiciona automáticamente en la carpeta del proyecto.
* **Desde Windows:** Abre PowerShell dentro de la carpeta (o navega con `cd ruta\al\proyecto`).

```powershell
# 1. Configurar el proyecto (solo la primera vez)
cmake -B build -G Ninja

# 2. Compilar
cmake --build build

# 3. Ejecutar
.\bin\main.exe
```

### 💡 Alternativa ultrarrápida: Code Runner (Opcional)
**¿Qué es?** Es una extensión muy popular en VS Code que te permite ejecutar código al vuelo con un solo clic o con el atajo **`Ctrl + Alt + N`**.

* **Si te da curiosidad probarla:** Solo instala la extensión **Code Runner** (`formulahendry.code-runner`) desde la pestaña de Extensiones (`Ctrl + Shift + X`).
* **Ya viene preconfigurada:** Esta plantilla ya incluye en `.vscode/settings.json` los ajustes óptimos para que, al presionar **`Ctrl + Alt + N`** (o el botón ▶️ *Run Code* arriba a la derecha), limpie automáticamente la consola (`Clear-Host`), compile con GCC/G++ y corra tu programa en la terminal integrada sin tocar nada más.
* **Tú decides:** Usa **CMake Tools** (barra inferior) para proyectos estructurados y depuración con GDB, o **Code Runner** para pruebas rápidas y programas de un solo archivo. Ambos conviven a la perfección en esta plantilla.

---

## 🛠️ Ventajas de este Enfoque

1. **Sin variables de entorno manuales:** Scoop instala todo de forma limpia en el espacio de usuario.
2. **IntelliSense automático:** CMake Tools genera la base de datos de compilación automáticamente. No necesitas lidiar con archivos `c_cpp_properties.json` ni escribir rutas de include a mano.
3. **Compilación incremental instantánea:** Ninja solo recompila los archivos modificados, ahorrando tiempo en proyectos con varios archivos.
4. **Multiplataforma:** La misma estructura y `CMakeLists.txt` funcionan sin cambios en Windows, WSL2 y Linux.
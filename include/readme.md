# 📂 Carpeta `include`

Coloca aquí tus archivos de cabecera en C o C++ (`.h` o `.hpp`).

### ¿Cómo usarlos?
En cualquier archivo dentro de `src/`, simplemente escribe:

```cpp
#include "mi_cabecera.h"
```

CMake ya tiene esta carpeta configurada como ruta de búsqueda de cabeceras, por lo que no necesitas escribir rutas relativas complejas (como `../include/mi_cabecera.h`).

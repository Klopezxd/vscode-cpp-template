# Modern & Fast C / C++ Template for VS Code (Windows, Linux & macOS)

> 🌐 **Language / Idioma:** **English** | [Español](README.es.md)

[![CI - Build & Test](https://github.com/Klopezxd/vscode-cpp-template/actions/workflows/ci.yml/badge.svg)](https://github.com/Klopezxd/vscode-cpp-template/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
![Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-lightgrey.svg)
![C++17](https://img.shields.io/badge/C%2B%2B-17-blue.svg)
![C17](https://img.shields.io/badge/C-17-blue.svg)
![CMake](https://img.shields.io/badge/CMake-3.15%2B-064F8C.svg)
![Ninja](https://img.shields.io/badge/Ninja-Build-black.svg)

A modern, production-ready, cross-platform starter template for **C** and **C++** development across **Windows, Linux, WSL, and macOS** using **VS Code**. Designed to eliminate configuration friction: effortlessly compiles both rapid single-file programs and structured multi-file architectures using **CMake**, **Ninja**, and **ClangFormat**.

---

## 🚀 Quick Setup (3-Minute Setup)

### Windows (PowerShell, no admin rights required)

#### 1. Install Scoop (if not already installed)
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

#### 2. Install Compiler and Build Tools
```powershell
scoop install mingw-winlibs cmake ninja
```

---

### Linux / WSL (Ubuntu, Debian, or AlmaLinux/CERN)

Run the command for your distribution:

```bash
# Ubuntu / Debian / WSL2
sudo apt update && sudo apt install -y build-essential cmake ninja-build gdb

# AlmaLinux / Fedora / RHEL (CERN Environment)
sudo dnf install -y gcc-c++ cmake ninja-build gdb
```

---

### macOS (Terminal with Homebrew)

Open your Terminal and run:

```bash
# 1. Apple Command Line Tools (Clang compiler & LLDB debugger)
xcode-select --install

# 2. Install CMake and Ninja
brew install cmake ninja
```

---

### Recommended VS Code Extensions (All Operating Systems)
Install the official extensions from the `Ctrl + Shift + X` panel:
* **C/C++** (`ms-vscode.cpptools`) — IntelliSense, GDB/LLDB debugging, and automated Clean Code formatting.
* **CMake Tools** (`ms-vscode.cmake-tools`) — Native build and execution integration with one click.

---

## 📋 How to Create a NEW Project with this Template

To create a new project on your computer, choose one of these options:

### Option 1: Clone or Use as Template on GitHub (Recommended)
1. On GitHub, click the green **"Use this template"** button -> **"Create a new repository"**.
2. Clone your newly created repository and open it in VS Code.

### Option 2: Copy Essential Files to a Fresh Folder
If you prefer creating a new folder manually (e.g. `C:\Projects\MyTask`), simply copy these essential files from this template:

```text
MyTask/
├── .vscode/               <-- Contains settings.json, launch.json, and extensions.json
├── src/                   <-- Place your main.cpp or exercise.c here
├── CMakeLists.txt         <-- Universal build definition
├── .clang-format          <-- Clean Code & auto-formatting rules
└── .gitignore             <-- Excludes build artifacts from Git
```

---

## ⚙️ First-Time Workspace Setup (One-time Step)

When opening your project folder in VS Code for the first time:

1. Press **`Ctrl + Shift + P`** and type:
   ```text
   CMake: Configure
   ```
2. Select your detected compiler kit (e.g. `GCC ... x86_64-w64-mingw32` on Windows, `GCC` on Linux, or `Clang` on macOS).
   *(If the list is empty, click `[Scan for kits]` to detect installed toolchains).*
3. Done! CMake Tools configures the build system in milliseconds and saves your preference.

---

## 📁 Supported Project Structures

This template automatically adapts without modifying `CMakeLists.txt`:

### Simple Mode (Single File)
Ideal for quick algorithms, problem-solving, single-file scripts, or competitive programming:
```
MyProject/
├── src/
│   └── main.cpp (or main.c / problem.cpp)
├── .vscode/
└── CMakeLists.txt
```
* Simply place your source code in `src/main.cpp` (or directly in the project root).
* No extra directories or configuration changes required.

### Modular Mode (Full Multi-File Projects)
Ideal for modular architectures, object-oriented systems, data structures, or libraries:
```
MyProject/
├── include/           # Header files (.h / .hpp)
├── src/               # Implementation files (.c / .cpp)
│   └── main.cpp
├── bin/               # Final executable binary (main.exe / main)
├── build/             # Intermediate CMake artifacts (ignored by Git)
├── CMakeLists.txt     # Universal build script
└── README.md
```
* Put header files in `include/` and source implementations in `src/`.
* `CMakeLists.txt` automatically discovers and links all files.

---

## 📝 Workflow: Adding New Files

* **Source Files (`.cpp` or `.c`):**
  * Always save them inside the **`src/`** directory.
  * `CMakeLists.txt` automatically detects all source files recursively. Just create your file, save, and build (`F7`).
* **Header Files (`.h` or `.hpp`):**
  * Save them inside the **`include/`** directory.
  * To include them from any file inside `src/`, simply write `#include "my_header.h"`. CMake already configures `include/` in the compiler search path, eliminating messy relative paths (like `../include/my_header.h`).
* ⚠️ **Important rule regarding `main()`:**
  * C and C++ require **exactly one `main()` function** per compiled target.
  * If you are working on multiple standalone exercises, ensure only one active file contains a `main()` function at a time (or comment out the others) to avoid multiple definition linker errors.

---

## ⌨️ How to Build and Run

### 1. From the VS Code Status Bar (Recommended)
At the bottom of your VS Code window, you will find direct controls provided by CMake Tools:

* **Build:** Press **`F7`** or click the **`⚙ Build`** button in the bottom status bar.
* **Run:** Click the **`▷` (Play)** button right next to the build icon (or press `Ctrl + Shift + F5`).
* **Debug (GDB / LLDB):** Press **`F5`** *(the debugger automatically pauses at `main()` so console windows stay open for inspection without abruptly terminating)*.
* **Clean Rebuild:** Open the command palette (`Ctrl + Shift + P`) and run `CMake: Clean Rebuild`.

### 2. From the Terminal (PowerShell / Bash / Zsh)
If you prefer running commands directly from the integrated terminal (**`Ctrl + ~`**):

```bash
# 1. Configure the project (first time only)
cmake -B build -G Ninja

# 2. Build the executable
cmake --build build

# 3. Run the binary
# On Windows:
.\bin\main.exe

# On Linux / macOS:
./bin/main
```

### 💡 Ultra-Fast Alternative: Code Runner (Optional)
This template includes optimized settings for the popular **Code Runner** extension (`formulahendry.code-runner`):
* Press **`Ctrl + Alt + N`** (or click the ▶️ icon in the top editor tab) to instantly clear the terminal, compile, and execute the active file without generating CMake build folders.

---

## 🛠️ Key Architectural Advantages

1. **Zero Manual Environment Variables:** Package managers (Scoop, APT, DNF, Homebrew) handle toolchain installations cleanly in user space.
2. **Automatic IntelliSense:** CMake Tools feeds the compilation database directly to the C/C++ extension. No manual `c_cpp_properties.json` or handwritten include paths needed.
3. **Instant Incremental Builds:** Ninja recompiles only modified translation units, delivering near-instant builds even across multiple files.
4. **Universal Cross-Platform:** The identical folder structure and `CMakeLists.txt` build natively on Windows, Linux, WSL, and macOS.
5. **Automated Clean Code:** Includes a preconfigured `.clang-format` based on industry standards (LLVM/Google adapted to 4 spaces, 100 column limit, explicit type alignment). Pressing **`Ctrl + S`** automatically aligns indentation, cleans braces, and sorts `#include` directives.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE) — Copyright (c) 2026 **Klever López**.
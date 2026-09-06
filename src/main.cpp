#include <iostream>
#include <string>
#include <vector>

int main() {
    std::cout << "========================================" << std::endl;
    std::cout << "  Plantilla C/C++ lista para trabajar!  " << std::endl;
    std::cout << "========================================" << std::endl;

    // Demostración rápida de C++17
    std::vector<std::string> tecnologias = {"C++17 / C17", "CMake", "Ninja", "VS Code"};

    std::cout << "\nEntorno configurado con:" << std::endl;
    for (const auto& item : tecnologias) {
        std::cout << "  - " << item << std::endl;
    }

    std::cout << "\nPuedes reemplazar este archivo con tu propio codigo." << std::endl;
    return 0;
}

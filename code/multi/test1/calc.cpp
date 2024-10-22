#include "../include/calc.h"
#include <iostream>

int main() {
  std::cout << "Add: " << add(5, 3) << std::endl;
  try {
    int result = divide(5, 3);
    std::cout << "Div: " << result << std::endl;
  } catch (const char *msg) {
    std::cerr << msg << std::endl;
  }
  return 0;
}

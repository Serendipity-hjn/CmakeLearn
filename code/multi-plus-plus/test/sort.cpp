#include "sort.h"
#include <iostream>

void printArray(int arr[], int size) {
  for (int i = 0; i < size; i++)
    std::cout << arr[i] << " ";
  std::cout << std::endl;
}

int main() {
  int arr[] = {64, 25, 12, 22, 11};
  int n = sizeof(arr) / sizeof(arr[0]);
  selectionSort(arr, n);
  std::cout << "Sorted array: ";
  printArray(arr, n);
  return 0;
}

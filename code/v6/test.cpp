#include <stdio.h>
#define NUMBER 3

int main() {
  int a = 10;
#ifdef DEBUG
  printf("我是一个程序猿, 我不会爬树...\n");
#endif
  for (int i = 0; i < NUMBER; ++i) {
    printf("hello, GCC!!!\n");
  }
  return 0;
}


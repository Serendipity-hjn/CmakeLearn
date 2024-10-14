#include <stdio.h>
#include "head.h"

int main()
{
    int a = 10, b = 5;
    printf("%d + %d = %d\n", a, b, add(a, b));
    printf("%d - %d = %f\n", a, b, divide(a, b));
    return 0;
}
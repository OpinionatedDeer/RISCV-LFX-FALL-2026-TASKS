#include <stdio.h>
#include <stdlib.h>

int call(int x) {
    int y = x + 1;
    return y;
}

int main() {
    int a = 5;
    int b = call(a);
    printf("%d\n", b);
    int c = call(b);
    printf("%d\n", c);
    return EXIT_SUCCESS;
}

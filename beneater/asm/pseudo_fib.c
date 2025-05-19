#include <stdio.h>

int main(void) {
    int x, y, A;

    while (1) {
        y = 1;
        A = 0;
        do {
            x = A;
            printf("%d\n", A);
            
            A = y;
            A += x;
            y = A;
            printf("%d\n", A);

            // Check overflow
            A = x;
            A += y;
        } while (A < 255);
    }
}
#include <stdio.h>
int main() {
    int sum = 0, n = 5;
    for (int i = 1; i <= n; ++i) {
        sum = sum + i;
    }
    printf("The sum of numbers from 1 to %d is %d\n", n, sum);
    return 0;
}


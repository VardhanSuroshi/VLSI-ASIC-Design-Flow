#include <stdio.h>
#include <math.h>

int main() {
    // Declare variables to hold the values
    unsigned long long int a;
    long long int b_max, b_min;

    // Calculate and assign the maximum value of a 64-bit unsigned number
    a = (unsigned long long int)(pow(2, 64) - 1);

    // Calculate and assign the maximum value of a 64-bit signed number
    b_max = (long long int)(pow(2, 63) - 1);

    // Calculate and assign the minimum value of a 64-bit signed number
    b_min = (long long int)(pow(2, 63) * (-1));

    // Print the calculated values
    printf("The max value of 64 bit unsigned number is %llu\n The max number of 64 bit signed number is %lld\n The min value of 64 bit signed number is %lld\n",a,b_max,b_min);

    return 0;
}

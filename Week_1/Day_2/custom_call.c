#include <stdio.h>

extern int load(int x, int y); // Declare the external "load" function

int main() {
  int result = 0;              // Initialize the result variable
  int count = 9;               // Initialize the count variable
  result = load(0x0, count+1); // Call the "load" function with arguments
  printf("Sum of numbers from 1 to 9 is %d\n", result); // Print the result
  return 0;                    // Return 0 to indicate successful execution
}


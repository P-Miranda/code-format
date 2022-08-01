#include <stdio.h>
#include <stdlib.h>

#define NUMBERS (10)

void print_numbers() {
  int i = 0;
  printf("Printing numbers...\n");

  for (i = 0; i < NUMBERS; i++) {
    printf("\t%d\n", i);
  }
  printf("Done!\n");
  return;
}

void print_inverse() { int i = 0; printf("Printing inverse numbers...\n"); for (i = NUMBERS-1; i >= 0; i--) { printf("\t%d\n", i); } printf("Done!\n"); return; }

int main(int argc, char *argv[]) {
  printf("This is a test program");
  for (int i = 0; i < argc; i++) {
    printf("%s\n", argv[i]);
  }

  print_numbers();
  print_inverse();

  return EXIT_SUCCESS;
}

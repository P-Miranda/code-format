#include <stdio.h>
#include <stdlib.h>

int main(int argc, char* argv[]){
    printf("This is a test program");
    for (int i=0; i<argc; i++){ printf("%s\n", argv[i]); }

    return EXIT_SUCCESS;
}

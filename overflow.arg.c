#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]){
    char buf[32];
    strcpy(buf, argv[1]);
    printf("%s\n", buf);
}


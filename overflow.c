#include <stdio.h>
#include <signal.h>

void return_input(void){

    char array[32];
    gets(array);
    printf("%s\n", array);
}

int main(){
    return_input();
    return 0;
}


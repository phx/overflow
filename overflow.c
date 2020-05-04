#include </var/mobile/Containers/Data/Application/9DB00A47-C3C4-4431-9A73-DFB81CB0ADEA/Library/usr/include/stdio.h>

void return_input(void){

    char array[32];
    gets(array);
    printf("%s\n", array);
}

int main(){
    return_input();
    return 0;
}


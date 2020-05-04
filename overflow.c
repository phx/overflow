void return_input(void){

    char array[32];
    gets(array);
    printf("%s\n", array);
}

main(){
    return_input();
    return 0;
}


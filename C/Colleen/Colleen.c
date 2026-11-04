#include <stdio.h>

/* this comment is outside */

void display_code()
{
    char *code = "#include <stdio.h>%1$c%1$c/* this comment is outside */%1$c%1$cvoid display_code()%1$c{%1$c%2$cchar *code = %3$c%4$s%3$c;%1$c%2$cprintf(code, 10, 9, 34, code);%1$c}%1$c%1$cint main(void)%1$c{%1$c%2$c/* this comment is in the main function */%1$c%2$cdisplay_code();%1$c%2$creturn 0;%1$c}%1$c";
    printf(code, 10, 9, 34, code);
}

int main(void)
{
    /* this comment is in the main function */
    display_code();
    return 0;
}
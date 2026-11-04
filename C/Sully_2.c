#include <stdio.h>
#include <stdlib.h>

#define CODE "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c#define CODE %2$c%3$s%2$c%1$c#define X %4$d%1$c%1$cint main(void)%1$c{%1$c    char filename[50];%1$c    char command[100];%1$c%1$c    if (X < 0)%1$c        return (0);%1$c%1$c    sprintf(filename, %2$cSully_%%d.c%2$c, X);%1$c    FILE *f = fopen(filename, %2$cw%2$c);%1$c    if (f == NULL)%1$c        return (1);%1$c%1$c    fprintf(f, CODE, 10, 34, CODE, X - 1);%1$c    fclose(f);%1$c%1$c    sprintf(command, %2$cgcc %%s -o Sully_%%d && ./Sully_%%d%2$c, filename, X, X);%1$c    system(command);%1$c%1$c    return (0);%1$c}%1$c"
#define X 1

int main(void)
{
    char filename[50];
    char command[100];

    if (X < 0)
        return (0);

    sprintf(filename, "Sully_%d.c", X);
    FILE *f = fopen(filename, "w");
    if (f == NULL)
        return (1);

    fprintf(f, CODE, 10, 34, CODE, X - 1);
    fclose(f);

    sprintf(command, "gcc %s -o Sully_%d && ./Sully_%d", filename, X, X);
    system(command);

    return (0);
}

#include <stdio.h>

/* this comment is outside */

#define CODE "#include <stdio.h>%1$c%1$c/* this comment is outside */%1$c%1$c#define CODE %2$c%3$s%2$c%1$c%1$c#define RETURN_SUCCESS return(0);%1$c%1$c#define FT()int main(void) { FILE *f = fopen(%2$cGrace_kid.c%2$c, %2$cw%2$c); if (f == NULL) return (1); fprintf(f, CODE, 10, 34, CODE);fclose(f);RETURN_SUCCESS}%1$c%1$cFT()%1$c"

#define RETURN_SUCCESS return(0);

#define FT()int main(void) { FILE *f = fopen("Grace_kid.c", "w"); if (f == NULL) return (1); fprintf(f, CODE, 10, 34, CODE);fclose(f);RETURN_SUCCESS}

FT()

/* Print lines beginning with or ending in 'a'. */

%{

#include <stdio.h>

#include <stdlib.h>
%}



%%

^[aA].* { printf("%s\n", yytext); }

.*[aA]$ { printf("%s\n", yytext); }

. ;

("\n") ;
%%



int main(int argc, char *argv[])

{

    if(argc == 2)
    {	  
        yyin = fopen(argv[1], "r");
        if (yyin == NULL) 
	{
            printf("\nFile %s could not be opened in read mode!!!\n", argv[1]);
            return 1;
        }
        printf("\n");
    }
    else if(argc == 1)
        yyin = stdin;
    else
    {
        printf("\nIncorrect Usage\n");
        printf("\nCorrect Usage: exe_name file_name\n");
        exit(0);
    }
    yylex();

    if(fclose(yyin) == EOF)
          printf("\nfclose failed!!!\n");
    return 0;

}



int yywrap()

{

    return 1;

}
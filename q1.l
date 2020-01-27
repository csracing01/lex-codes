/* Print line number before line. */

%{
 
#include <stdio.h>
#include <stdlib.h>
int yylineno;
 
%}



%%


^(.*)\n { printf("%4d\t%s", ++yylineno, yytext); }

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
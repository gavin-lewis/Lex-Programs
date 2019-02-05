This repository contains the LEX files used perfom specific tasks for lexical analysis.

Linux environment is required to run these programs.
To run these codes, install LEX on the Ubuntu system.

Steps to install LEX tool:
1. Open the terminal
2. Run the command: sudo apt-get install flex 
3. Enter the root user password

Note: root access is required to install Lex Tool.

Compiling and executing the codes:
1. Open terminal
2. Open the directory containing the .l file
3. Run command: lex filename.l
4. Run command: cc lex.yy.c
5. Run command: ./a.out

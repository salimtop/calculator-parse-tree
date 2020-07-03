• Makefile
– This is the file that is used to build the project. You can build the project by just typing make on the command line.
• calc.l
– This file contains the lex specification for the calculator project.
• calc.y
– This file contains the yacc specification for the calculator project.
• input.txt
– This file contains list of mathematical function that you are going to test your calculator.

required: 
sudo apt-get install gcc make flex bison

-Go into the ‘calc’ folder and run make command. make will compile your source codes according to the rules in Makefile.
make

- to test your program:
Make test file=input1.txt

-Inspect the output of the program and the content of input1.txt. To see file content:
cat input1.txt

-to clean the compiled files for re-compilation, run:
make clean

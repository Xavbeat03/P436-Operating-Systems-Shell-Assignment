# P436-Operating-Systems-Shell-Assignment
Shell Assignment for P436

## Requirements

Write a program that will read the formatted hard drive discussed in class.

You are writing a shell program. It will accept various commands over the course of the project.

Your program should be able to read the disk and output the disk. Therefore you have to strip the addressing lines/columns on input and to insert them on output. When you print the file to paper (always have to be able to do that) the addressing lines should be there so you can get your ruler out.

The example I gave was in a Word file, you should use a text file for storage, no formatting issues.

You program should be able to handle the filename as a command line parameter, or if there is no command line parameter, from standard IO. So you can run your program on DOS in two ways:

C:\shell dist.txt

C:\type dist.txt | shell

Linux version

% shell dist.txt

% cat dist.txt | shell

Your program should also detect the following command line parameters:

-v or -V :: print the version number of your program’

-h or -H or -? :: print a usage/help message
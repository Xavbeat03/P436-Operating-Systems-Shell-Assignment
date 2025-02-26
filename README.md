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

## Notes

1\. This is a flat file system, single directory, 32 lines of 32 bytes (64 nibbles).

2\. Root is always at Cluster 0.

3\. For next pointers, 0 is null, nothing points to root.

4\. “XX:” lines (two of them) are just for your interpretation, not on the disk

5\. 01: first three characters of all data lines are for your interpretation, also.

--------------------------------------------------------------

### Byte zero of every cluster:

0: folder

1: empty

2: damaged

3: file header

4: file data

--------------------------------------------------------------

### Root Cluster (Root dir always starts at cluster 0, LL)
Start   LenNibbles  Contents

00      01          cluster type

01      02          pointer to linked list of available

03      02          pointer to linked list of bad clusters

05      02          pointer to linked list of file headers

07      XX          volume name (end with null character)

--------------------------------------------------------------

### File Header Cluster (self contained, no extension)

Start   LenNibbles  Contents

00      01          cluster type

01      02          next pointer to next file

03      02          next pointer to file data cluster (if necessary)

05      XX          file name (end with null character)

Remainder is file data

--------------------------------------------------------------

### File Data Cluster

Start   LenNibbles  Contents

00      01          cluster type

01      02          Next pointer to file data cluster extension
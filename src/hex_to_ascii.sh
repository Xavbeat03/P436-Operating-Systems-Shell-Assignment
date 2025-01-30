#!/bin/bash

function hex_to_ascii_func() {
    # Get the first argument, define it as local variable hex_string
    # $1 : the first arg passed to the function
    local hex_string="$1"

    # Get the length of the hex string
    local size=${#hex_string}
    # Convert each pair of characters from hex to ascii and print them one by one
    # i : index variable
    # ${hex_string} : the hex string passed to the function
    # ${hex_string}; i += 2 : increment i by 2
    for (( i = 0; i < size; i += 2 )); do
        # echo : print the output
        # ${hex_string:i:2} : get the substring of the hex string from i to i+2

        # xxd : creates a hex dump of a given file or standard input
        # -r : reverse operation, convert hexdump into binary
        # -p : outputs reversed hexdump as normal text
        echo "${hex_string:i:2}" | xxd -r -p | cat
    done
}
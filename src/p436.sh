#!/bin/bash

# Functions

# Convert a hex string to ASCII
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

# Takes a unconverted Disk line and converts it to readable for hex_to_ascii_func
function interpret_line(){
    # Get the first argument, define it as local variable line
    local line=$1
    # Get the substring of the line from the 3rd character
    local short_line="${line:3}"
    # Call the hex_to_ascii_func with the short_line
    hex_to_ascii_func "$short_line"
}



# Variables

input_hex="AA:48656c6c6f2c2058415649455221"
# File path as an argument
file=$1

# This is a basic shell script

result=$(interpret_line "$input_hex")


while IFS= read -r line; do
    # Get the first two characters of the line
    first_two="${line:0:2}"

    # Check if the first two characters are "XX"
    if [[ "$first_two" == "XX" ]]; then
        # Skip the line and continue with the next iteration
        continue
    fi

    # Call the interpret_line function with the line, and pass the output to cat
    interpret_line "$line" | cat
done < "$file"


printf "\n%s" "$result"


# End of script
printf "\nScript execution completed.\n"


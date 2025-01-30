#!/bin/bash

# Functions

# Function to print the header
function print_header() {
    
    echo "XX:                                                                1                                                               2                                                               3"
    echo "XX:0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   "
}

# Function to format and print the interpreted line with hex addressing
function format_and_print_line() {
    local address=$1
    local interpreted_line=$2

    # Print the address
    printf "%s: " "$address"

    # Print each character with spaces in between
    for (( i = 0; i < ${#interpreted_line}; i++ )); do
        printf "%-2s" "${interpreted_line:i:1}"
    done
    echo
}
# Convert a hex string to ASCII
function hex_to_ascii_func() {
    
    # Load the hex to ASCII dictionary into an associative array
    declare -A hex_to_ascii_dict

    # Read the hex to ASCII dictionary file line by line
    # IFS=": " : set the input field separator to ": "
    # read -r hex ascii : read the hex and ASCII values into variables hex and ascii
    # while ... done < "assets/Hex_To_ASCII_Dict.txt" : read from the file Hex_To_ASCII_Dict.txt
    while IFS=": " read -r hex ascii; do
        # Assign the ASCII value to the hex key in the dictionary
        hex_to_ascii_dict["$hex"]="$ascii"
        
    done < "assets/Hex_To_ASCII_Dict.txt"

    # Print line address starter

    address=0

    printf "XX:"

    # Individual characters
    # Get the first argument, define it as local variable hex_string
    local hex_string="$1"

    # Get the length of the hex string
    local size=${#hex_string}

    # Convert each pair of characters from hex to ascii and print them one by one
    for (( i = 0; i < size; i += 2 )); do
        # Get the substring of the hex string from i to i+2
        hex_pair="${hex_string:i:2}"
        # Print the corresponding ASCII character from the dictionary

        value_length=${#hex_to_ascii_dict[$hex_pair]}
        if [ "$value_length" -eq 1 ]; then
            echo -n "${hex_to_ascii_dict[$hex_pair]}       "
        elif [ "$value_length" -eq 2 ]; then
            echo -n "${hex_to_ascii_dict[$hex_pair]}      "
        elif [ "$value_length" -eq 3 ]; then
            echo -n "${hex_to_ascii_dict[$hex_pair]}     "
        fi

    done
    echo
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

function interpret_file(){

    # Print the header
    print_header

    while IFS= read -r line; do
        # Get the first two characters of the line
        first_two="${line:0:2}"

        # Check if the first two characters are "XX"
        if [[ "$first_two" == "XX" ]]; then
            # Skip the line and continue with the next iteration
            continue
        fi
        if [[ "$first_two" == "" ]]; then
            # Skip the line and continue with the next iteration
            break
        fi

        # Call the interpret_line function with the line, and pass the output to cat
        interpret_line "$line" | cat
    done
}

# Variables

# File path as an argument
file=$1

# Main

pwd

printf "Script execution started.\n"

# This is a basic shell script

interpret_file < "$file"

# End of script
printf "\nScript execution completed.\n"


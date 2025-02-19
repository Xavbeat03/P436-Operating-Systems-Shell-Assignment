#!/bin/bash
# Xavier B

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

    # Individual characters
    # Get the first argument, define it as local variable hex_string
    local hex_string="$1"

    # Get the length of the hex string
    local size=${#hex_string}

    # Works on the first character
    echo -n "${hex_to_ascii_dict['0'${hex_string:0:1}]} "

    # Convert each pair of characters from hex to ascii and print them one by one
    for (( i = 1; i < size-1; i += 2 )); do
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

    echo -n "${hex_to_ascii_dict["0${hex_string:$size-1:1}"]}"
    
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

# Interpret the file
function interpret_file(){

    # Print the header
    print_header

    local address=0

    while IFS= read -r line; do
        # Get the first two characters of the line
        first_two="${line:0:2}"

        # Check if the first two characters are "XX"
        if [[ "$first_two" == "XX" ]]; then
            # Skip the line and continue with the next iteration
            continue
        fi
        # Check if the first two characters are empty
        if [[ "$first_two" == "" ]]; then
            # Skip the line and continue with the next iteration
            break
        fi

        # Print line address starter
        # Convert the address to a 2-digit hexadecimal number
        
        hex_address=$(printf "%02X" $address)

        # Prepends a 0 if the hex address is only 2 characters long
        if [ ${#hex_address} -eq 2 ]; then
            hex_address="0"$hex_address
        fi

        # Get the first two characters of the hex address
        hex_address="${hex_address:0:2}"

        # Print the hex address
        printf "%s:" "$hex_address"

        # Increment the address by 16
        (( address+=16 ))

        # Call the interpret_line function with the line, and pass the output to cat
        interpret_line "$line" | cat
    done
}

# Interprets the printed file system from the disk image
function interpret_file_system(){
    local file=$1
    local address=0 # Address of the current line
    local line_num=0 # Line number of the current line
    local final_value_length=4 # Each stored character is at most 4 characters long in the passed file system

    while IFS= read -r line; do

        if (( line_num < 2 )); then
            line_num=$((line_num+1))
            continue
        fi
        
        local short_line # Shortened line for interpretation
        short_line="${line:3}" # Get the substring of the line from the 3rd character
        local doContinue=false # Continue flag
        
        for (( i=0; i<${#short_line}; i+=final_value_length )); do
            local section_num=$((i / final_value_length))
            local section="${short_line:$i:$final_value_length}" # Grabs the a section of the string, representing a character
            local important_headers=("NUL " "ETX " "EOT ")

            # Check the first value of the section (The first character)
            if [ "$section_num" -eq 0 ]; then
                # Check if the section is not an important header (NUL, ETX, EOT)
                if [[ ! " ${important_headers[*]} " =~ ${section} ]]; then
                    doContinue=true # Continue flag
                    break
                fi
            fi
            
        done

        if [ "$doContinue" == true ]; then
            continue
        fi

        if (( line_num >= 2 )); then
            printf "%s\n" "$short_line"
        fi


        line_num=$((line_num+1))
    done < "$file" > "./temp/interpreted_file_system.txt" # Write the interpreted file system to a temporary file

    # Print the interpreted file system

    local last_line
    last_line=$(tail -n 1 "./temp/interpreted_file_system.txt")

    printf "\nInterpreted File System:\n\n"
    while IFS= read -r line; do
        local first_char="${line:0:4}" # Get the first character of the line
        local word
        local temp_word_file_path="./temp/word"
        local is_last_line
        
        # Check if the line is the last line
        if [ "$line" == "$last_line" ]; then
            is_last_line=true
        else
            is_last_line=false
        fi
        
        case $first_char in
            "NUL ") # Directory
                for (( i=28; i<${#line}; i+=4 )); do
                    if [[ "${line:$i:4}" == "NUL " ]]; then # Check if the value is NUL, if so break
                        break
                    fi
                    printf "%s " "${line:$i:4}"
                done > "$temp_word_file_path"
                word=$(< "$temp_word_file_path")
                
                printf "%s\n" "${word// /}" # Prints and removes spaces
                
                rm "$temp_word_file_path"

                ;;
            "ETX ") # File
                for (( i=20; i<${#line}; i+=4 )); do
                    if [[ "${line:$i:4}" == "NUL " ]]; then # Check if the value is NUL, if so break
                        break
                    fi
                    printf "%s " "${line:$i:4}"
                done > "$temp_word_file_path"
                word=$(< "$temp_word_file_path")
                # Check if the line is the last line
                if [ "$is_last_line" == true ]; then
                    printf " └─🠶 %s\n" "${word// /}" # Prints and removes spaces
                else
                    printf " ├─🠶 %s\n" "${word// /}"
                fi
                
                rm "$temp_word_file_path"

                ;;
        esac
        

    done < "./temp/interpreted_file_system.txt"

    # Remove the interpreted file system temporary file
    rm "./temp/interpreted_file_system.txt"

}

# Function to display help
function help(){
    printf "Usage: ./p436.sh <file_path>\n"
    printf "Converts a disk image file (.txt) to ASCII.\n"
    printf "Options:\n"
    printf "  -h, -H, -?, --help : Display help\n"
    printf "  -v, -V, --version : Display version\n"
    printf "  -f <file_path>, --file <file_path>: Specify the file path\n"
    printf "  -dir -f <file_path>: Interpret the file system\n"
}

# Function to display version
function version(){
    printf "Version: %s\n" "$version"
}

function file_check(){
    # Check if the file exists
    if [ ! -f "$file" ]; then
        printf "File not found.\n"
        exit_and_clean
    fi

    case "$file" in
        *.txt) # File is a text file
            printf "File is a text file.\n"
            ;;
        *) # File is not a text file
            printf "File is not a text file. Exiting.\n"
            exit_and_clean
            ;;
    esac
}

# Interprets the file and prints out the internal directory of the formatted disk
function directory(){
    printf "Interpreting the file...\n"
    local f # Interpreted File output for reading
    # Create a temporary directory and file
    mkdir "./temp"
    interpret_file < "$file" > "./temp/interpreted_file.txt"

    # Work on the interpreted file
    f="./temp/interpreted_file.txt"

    interpret_file_system "$f"

    # Remove temporary file
    rm "./temp/interpreted_file.txt"
    rmdir "./temp"
    
}

# Checks if the disk file is malformed
function malformed_check(){
    local i=0
    while IFS= read -r line; do
        # Get the first two characters of the line
        first_two="${line:0:2}"
        first_data="${line:3:4}"

        # Check if the first two characters are "XX"
        if [[ "$first_two" == "XX" ]]; then
            # Skip the line and continue with the next iteration
            continue
        fi
        # Check if the first two characters are empty
        if [[ "$first_two" == "" ]]; then
            # Skip the line and continue with the next iteration
            break
        fi

        if [ "$first_data" == "2" ]; then
            printf "Malformed disk file.\n"
            printf "Damaged data block.\n"
            exit_and_clean
        fi

        # Check if the line is not 64 characters long
        if [ ${#line} -ne 67 ] && [ $i != 0 ]; then
            printf "Malformed disk file.\n"
            printf "Line %d is not 64 characters long.\n" "$i"
            exit_and_clean
        fi

        i=$((i+1))
    done < "$file"
}

# Exit and clean up
function exit_and_clean(){
    if [ -f "./temp_input.txt" ]; then
        rm "./temp_input.txt"
    fi
    printf "\nScript execution completed.\n"
    exit 1
}

# Variables

version="1"

# Check if the input is from a pipe
if [ ! -t 0 ]; then
    cat > ./temp_input.txt
    file="./temp_input.txt"
fi

# Main

# Main function
main(){
    case "$#" in
        0) # No arguments
            if [ -s "./temp_input.txt" ]; then
                main -f "./temp_input.txt"
            else
                help
            fi
            ;;
        1) # Continue with the script
            case "$1" in
                -h|-H|-\?|--help|"") # Display help
                    help

                    ;;
                -v|--version|-V) # Display version
                    version

                    ;;
                -f|--file) # File path not specified
                    printf "File path not specified.\n"
                    ;;
                *) # Invalid option
                    printf "Invalid option.\n"
                    exit_and_clean
                    ;;
            esac
            ;;
        2) # Continue with the script
            case "$1" in
                -f|--file) # File path specified
                    file=$2 # File path
                    file_check
                    malformed_check

                    directory
                    ;;

                --interpret-and-print) # Interpret and print the disk file
                    file=$2 # File path

                    file_check
                    malformed_check
                    interpret_file < "$file"
                    ;;

                *) # Invalid option
                    printf "Invalid option.\n"
                    exit_and_clean
                    ;;
            esac
            ;;
        3) 
            case "$1" in
                -dir)
                    case "$2" in
                        -f|--file) # File path specified
                            file=$3 # File path
                            file_check
                            malformed_check

                            directory
                            ;;
                        *) # File path not specified
                            printf "File path not specified.\n"
                            ;;
                    esac
                    ;;
                *) # Invalid option
                    printf "Invalid option.\n"
                    exit_and_clean
                    ;;
            esac
            ;;
        *) # More than one argument
            printf "Too many arguments.\n"
            exit_and_clean
            ;;
    esac

    

}

# Start of script
printf "Script execution started.\n"

main "$@"

# End of script
exit_and_clean

#!/bin/bash
# Xavier B

# Functions

# Function to print the header
function print_header() {
    
    echo "XX:                                                                1                                                               2                                                               3"
    echo "XX:0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   0   1   2   3   4   5   6   7   8   9   A   B   C   D   E   F   "
}

# Function to format and print the interpreted line with hex addressing
# Function to format and print the interpreted line with hex addressing
# function format_and_print_line() {
#     local address=$1
#     local interpreted_line=$2

#     # Print the address
#     printf "%s: " "$address"

#     # Print each character with spaces in between
#     for (( i = 0; i < ${#interpreted_line}; i++ )); do
#         printf "%-2s" "${interpreted_line:i:1}"
#     done
#     echo
# }


# Function to create the hex to ASCII dictionary
function create_hex_to_ascii_dict_worker(){
    
    printf "00: NUL \n"
    printf "01: SOH \n"
    printf "02: STX \n"
    printf "03: ETX \n"
    printf "04: EOT \n"
    printf "05: ENQ \n"
    printf "06: ACK \n"
    printf "07: BEL \n"
    printf "08: BS  \n"
    printf "09: HT  \n"
    printf "0A: LF  \n"
    printf "0B: VT  \n"
    printf "0C: FF  \n"
    printf "0D: CR  \n"
    printf "0E: SO  \n"
    printf "0F: SI  \n"
    printf "10: DLE \n"
    printf "11: DC1 \n"
    printf "12: DC2 \n"
    printf "13: DC3 \n"
    printf "14: DC4 \n"
    printf "15: NAK \n"
    printf "16: SYN \n"
    printf "17: ETB \n"
    printf "18: CAN \n"
    printf "19: EM  \n"
    printf "1A: SUB \n"
    printf "1B: ESC \n"
    printf "1C: FS  \n"
    printf "1D: GS  \n"
    printf "1E: RS  \n"
    printf "1F: US  \n"
    printf "20: SP  \n"
    printf "21: !   \n"
    printf "22: \"   \n"
    printf "23: #   \n"
    printf "24: $   \n"
    printf "25: %%   \n"
    printf "26: &   \n"
    printf "27: \'   \n"
    printf "28: (   \n"
    printf "29: )   \n"
    printf "2A: *   \n"
    printf "2B: +   \n"
    printf "2C: ,   \n"
    printf "2D: -   \n"
    printf "2E: .   \n"
    printf "2F: /   \n"
    printf "30: 0   \n"
    printf "31: 1   \n"
    printf "32: 2   \n"
    printf "33: 3   \n"
    printf "34: 4   \n"
    printf "35: 5   \n"
    printf "36: 6   \n"
    printf "37: 7   \n"
    printf "38: 8   \n"
    printf "39: 9   \n"
    printf "3A: :   \n"
    printf "3B: ;   \n"
    printf "3C: <   \n"
    printf "3D: =   \n"
    printf "3E: >   \n"
    printf "3F: ?   \n"
    printf "40: @   \n"
    printf "41: A   \n"
    printf "42: B   \n"
    printf "43: C   \n"
    printf "44: D   \n"
    printf "45: E   \n"
    printf "46: F   \n"
    printf "47: G   \n"
    printf "48: H   \n"
    printf "49: I   \n"
    printf "4A: J   \n"
    printf "4B: K   \n"
    printf "4C: L   \n"
    printf "4D: M   \n"
    printf "4E: N   \n"
    printf "4F: O   \n"
    printf "50: P   \n"
    printf "51: Q   \n"
    printf "52: R   \n"
    printf "53: S   \n"
    printf "54: T   \n"
    printf "55: U   \n"
    printf "56: V   \n"
    printf "57: W   \n"
    printf "58: X   \n"
    printf "59: Y   \n"
    printf "5A: Z   \n"
    printf "5B: [   \n"
    printf "5C: \   \n"
    printf "5D: ]   \n"
    printf "5E: ^   \n"
    printf "5F: _   \n"
    printf "60: \`   \n"
    printf "61: a   \n"
    printf "62: b   \n"
    printf "63: c   \n"
    printf "64: d   \n"
    printf "65: e   \n"
    printf "66: f   \n"
    printf "67: g   \n"
    printf "68: h   \n"
    printf "69: i   \n"
    printf "6A: j   \n"
    printf "6B: k   \n"
    printf "6C: l   \n"
    printf "6D: m   \n"
    printf "6E: n   \n"
    printf "6F: o   \n"
    printf "70: p   \n"
    printf "71: q   \n"
    printf "72: r   \n"
    printf "73: s   \n"
    printf "74: t   \n"
    printf "75: u   \n"
    printf "76: v   \n"
    printf "77: w   \n"
    printf "78: x   \n"
    printf "79: y   \n"
    printf "7A: z   \n"
    printf "7B: {   \n"
    printf "7C: |   \n"
    printf "7D: }   \n"
    printf "7E: ~   \n"
    printf "7F: DEL \n"
}

# Function to create the hex to ASCII dictionary
function create_hex_to_ascii_dict(){


    # Check if the assets directory exists
    if [ ! -d "assets" ]; then
        mkdir -p assets
    fi

    if [ -f "assets/Hex_To_ASCII_Dict.txt" ]; then
        rm "assets/Hex_To_ASCII_Dict.txt"
    fi

    # Create the hex to ASCII dictionary file
    create_hex_to_ascii_dict_worker > assets/Hex_To_ASCII_Dict.txt
    
    
}

# Function to create the ASCII to hex dictionary
# Function to create the ASCII to hex dictionary
# function create_ascii_to_hex_dict_worker(){
#     printf " : 20\n"
#     printf "!: 21\n"
#     printf "\": 22\n"
#     printf "#: 23\n"
#     printf "$: 24\n"
#     printf "%%: 25\n"
#     printf "&: 26\n"
#     printf "\': 27\n"
#     printf "(: 28\n"
#     printf "): 29\n"
#     printf "*: 2A\n"
#     printf "+: 2B\n"
#     printf ",: 2C\n"
#     printf "\-: 2D\n"
#     printf ".: 2E\n"
#     printf "/: 2F\n"
#     printf "0: 30\n"
#     printf "1: 31\n"
#     printf "2: 32\n"
#     printf "3: 33\n"
#     printf "4: 34\n"
#     printf "5: 35\n"
#     printf "6: 36\n"
#     printf "7: 37\n"
#     printf "8: 38\n"
#     printf "9: 39\n"
#     printf ":: 3A\n"
#     printf ";: 3B\n"
#     printf "<: 3C\n"
#     printf "=: 3D\n"
#     printf ">: 3E\n"
#     printf "?: 3F\n"
#     printf "@: 40\n"
#     printf "A: 41\n"
#     printf "B: 42\n"
#     printf "C: 43\n"
#     printf "D: 44\n"
#     printf "E: 45\n"
#     printf "F: 46\n"
#     printf "G: 47\n"
#     printf "H: 48\n"
#     printf "I: 49\n"
#     printf "J: 4A\n"
#     printf "K: 4B\n"
#     printf "L: 4C\n"
#     printf "M: 4D\n"
#     printf "N: 4E\n"
#     printf "O: 4F\n"
#     printf "P: 50\n"
#     printf "Q: 51\n"
#     printf "R: 52\n"
#     printf "S: 53\n"
#     printf "T: 54\n"
#     printf "U: 55\n"
#     printf "V: 56\n"
#     printf "W: 57\n"
#     printf "X: 58\n"
#     printf "Y: 59\n"
#     printf "Z: 5A\n"
#     printf "[: 5B\n"
#     printf "\: 5C\n"
#     printf "]: 5D\n"
#     printf "^: 5E\n"
#     printf "_: 5F\n"
#     printf "\`: 60\n"
#     printf "a: 61\n"
#     printf "b: 62\n"
#     printf "c: 63\n"
#     printf "d: 64\n"
#     printf "e: 65\n"
#     printf "f: 66\n"
#     printf "g: 67\n"
#     printf "h: 68\n"
#     printf "i: 69\n"
#     printf "j: 6A\n"
#     printf "k: 6B\n"
#     printf "l: 6C\n"
#     printf "m: 6D\n"
#     printf "n: 6E\n"
#     printf "o: 6F\n"
#     printf "p: 70\n"
#     printf "q: 71\n"
#     printf "r: 72\n"
#     printf "s: 73\n"
#     printf "t: 74\n"
#     printf "u: 75\n"
#     printf "v: 76\n"
#     printf "w: 77\n"
#     printf "x: 78\n"
#     printf "y: 79\n"
#     printf "z: 7A\n"
#     printf "{: 7B\n"
#     printf "|: 7C\n"
#     printf "}: 7D\n"
#     printf "~: 7E\n"
# }

# Function to create the ASCII to hex dictionary
# function create_ascii_to_hex_dict() {
#     # Check if the assets directory exists
#     if [ ! -d "assets" ]; then
#         mkdir -p assets
#     fi

#     if [ -f "assets/ASCII_To_Hex_Dict.txt" ]; then
#         rm "assets/ASCII_To_Hex_Dict.txt"
#     fi

#     # Create the ASCII to hex dictionary file
#     create_ascii_to_hex_dict_worker > assets/ASCII_To_Hex_Dict.txt

# }

# Convert a hex string to ASCII
function hex_to_ascii_func() {
    
    

    # Load the hex to ASCII dictionary into an associative array
    declare -A hex_to_ascii_dict

    # check if the dictionary file exists if not create it
    create_hex_to_ascii_dict

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

# Interprets the printed file system from the disk image
# Uses the file local variable and takes 1 argument
function interpret_file_system_read_file(){
    local char_length=4 # Each stored character is at most 4 characters long in the passed file system
    local file=$1 # Interpreted file system
    local file_to_read=$2 # File to read from the disk image
    local file_to_read_line_num="null" # Line number of the file to read
    local file_to_read_key="null" # Key of the file to read

    local address=0 # Address of the current line
    local line_num=0 # Line number of the current line

    # Create an associative array for our dictionary
    declare -A disk_dict

    # Read the file line by line
    while IFS= read -r line; do
        # Skip header rows
        if (( line_num < 2 )); then
            line_num=$((line_num+1))
            continue
        fi
        
        # Extract key (first 2 characters)
        local key="${line:0:2}"
        
        # Create and load the hex to ASCII dictionary
        declare -A hex_to_ascii_dict
        create_hex_to_ascii_dict
        
        # Load the hex to ASCII dictionary
        while IFS=": " read -r hex ascii; do
            hex_to_ascii_dict["$hex"]="$ascii"
        done < "assets/Hex_To_ASCII_Dict.txt"
        
        # Convert key from hex to ASCII
        key="${hex_to_ascii_dict["$key"]}"
        
        # Extract value (everything after the 2nd character)
        local value="${line:3}"
        
        # Add to dictionary
        disk_dict["$key"]="$value"
        
        # Stores the file name on that line
        local disk_file_name=""

        # iterate through the line and determine the file name via splicing
        if [ "${line:3:4}" == "ETX " ]; then 
            for (( i=23; i<${#line}; i+=4 )); do
                if [[ "${line:$i:4}" == "NUL " ]]; then # Check if the value is NUL, if so break
                    break
                fi
                if [[ "${line:$i:4}" == "SP  " ]]; then # Value is representative of a space
                    disk_file_name+=" "
                    
                else # Value is not a space
                    local char="${line:$i:4}"
                    disk_file_name+="${char// /}" # Remove spaces
                fi
            done

        fi

        if [ "$disk_file_name" == "$file_to_read" ]; then
            file_to_read_line_num=$line_num
            file_to_read_key=$key
        fi

        
        # Increment line number
        line_num=$((line_num+1))
    done < "$file"

    # Now search for the file to read
    printf "Looking for file %s in the disk image\n" "$file_to_read"

    # Process the dictionary to find and read the file
    # TODO: Implement file reading logic using disk_dict

     # Pointer to the next file

    # Check if the file to read was found
    if [ "$file_to_read_line_num" == "null" ]; then
        printf "File not found in the disk image.\n"
    else # File was found
        printf "File found in the disk image.\n"
        printf "Reading file...\n"

        local file_to_read_line=${disk_dict["$file_to_read_key"]} # Read the file from the dictionary
        local file_name_length=${#file_to_read}

        local next_file_pointer="${file_to_read_line:12:4}" # Pointer to the next file
        local file_contents="" # Contents of the file

        for (( i=(23+(file_name_length*8)+5); i<${#file_to_read_line}; i+=4 )); do
            if [[ "${file_to_read_line:$i:4}" == "NUL " ]] || [[ "${file_to_read_line:$i:4}" == "NUL" ]]; then # Check if the value is NUL, if so break
                break
            fi
            if [[ "${file_to_read_line:$i:4}" == "SP  " ]]; then # Value is representative of a space
                file_contents+=" "
                continue
            fi
            local character="${file_to_read_line:$i:4}"
            file_contents+="${character// /}" # Remove spaces
        done

        if [ "$next_file_pointer" == "NUL " ]; then
            printf "File contents: %s\n" "$file_contents"
        else
            # Remove spaces from next_file_pointer
            next_file_pointer="${next_file_pointer// /}"

            while [ "$next_file_pointer" != "NUL" ]; do
                next_file_line="${disk_dict["$next_file_pointer"]}"
                
                next_file_pointer="${next_file_line:4:4}" # Pointer to the next file
                # Remove spaces from next_file_pointer
                next_file_pointer="${next_file_pointer// /}"
                
                next_file_contents="" # Contents of the next file

                for (( i=12; i<${#next_file_line}; i+=4 )); do
                    if [[ "${next_file_line:$i:4}" == "NUL " ]]; then # Check if the value is NUL, if so break
                        break
                    fi
                    if [[ "${next_file_line:$i:4}" == "SP  " ]]; then # Value is representative of a space
                        next_file_contents+=" "
                        continue
                    fi
                    local character="${next_file_line:$i:4}"
                    next_file_contents+="${character// /}" # Remove spaces
                done

                file_contents+="$next_file_contents" # Append the next file contents to the file contents
            done
            printf "File contents: %s\n" "$file_contents"
        fi

    fi
}

# Function to create a blank disk, takes 3 arguments: disk name, sector count, and cluster size
function create_blank_disk(){
    # Get the arguments
    local disk_name=$1
    local sector_count=$2
    local cluster_size=$3

    # Create the disk file
    touch "$disk_name.txt"

    # Create the header
    # line 1
    printf "XX:                " 

    for (( i=1; i<$(( cluster_size/16 )); i++ )); do
        if [ ${#i} -eq 1 ]; then
            printf "%X               " $i 
        elif [ ${#i} -eq 2 ]; then
            printf "%X              " $i 
        else
            printf "%X             " $i 
        fi    
    done
    printf "\n" 


    # line 2
    printf "XX:" 
    for (( i=0; i< cluster_size; i+=16 )); do
        for (( j=0; j<16; j++ )); do
            printf "%01X" $j 
        done
    done
    printf "\n" 

   

    # Create the disk

    # Add constant disk data for the first sector
    printf "00:0010000"
    

    # Disk name exceeds reasonable length and goes over the cluster size
    if [ ${#disk_name} -gt $(( cluster_size - 10 )) ]; then
        printf " Disk name too long\n" >> stdout
        exit_and_clean
    fi

    local disk_name_length=${#disk_name}

    # Convert disk name to hex
    for (( i=0; i<disk_name_length; i++ )); do
        # Convert the character to hex
        printf "%02X" "'${disk_name:$i:1}"
    done
    

    # Add right 0 padding
    if [ "$cluster_size" -gt $(( disk_name_length + 7 )) ]; then
        # Adjust for characters already added
        for (( i=0; i< $(( cluster_size - (disk_name_length * 2) - 7 )); i++ )); do
            printf "0"
        done
        printf "\n"
    fi

    # Add the rest of the sectors
    for (( i=1; i < sector_count; i++ )); do
        # Print the sector number
        printf "%02X:" $i
        # Sector is empty
        printf "1";
        # Sector pointer
        if [ $i -lt $(( sector_count - 1 )) ]; then
            # Points to the next sector
            printf "%02X" $(( i + 1 ))
        else
            # Last sector points to nothing
            printf "00"
        fi
        # Add right 0 padding
        for (( j=0; j< cluster_size - 3; j++ )); do
            printf "0"
        done
        # New line
        printf "\n"
    done
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
    printf "  <disk_name> <sector_count> <cluster_size>: Create a new blank disk at <disk_name>.txt\n"
    printf "  -type/-cat <internal_file_name> -f <file_path>: Read the file from the disk image\n"
    printf "  -f <file_path> -du/--disk-usage: Analyze disk usage\n"
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

# Function to analyze disk usage
function analyze_disk_usage(){
    local used_clusters="0"
    local free_clusters="0"
    local bad_clusters="0"
    local total_clusters="0"
    local total_used_clusters="0"

    local line_num=0

    while IFS= read -r line; do
        # Get the first two characters of the line
        first_two="${line:0:2}"
        first_data="${line:3:4}"

        if [[ line_num -lt 2 ]]; then
            line_num=$((line_num+1))
            continue
        fi
        # Check if the first two characters are empty
        if [[ "$first_two" == "" ]]; then
            # Skip the line and continue with the next iteration
            break
        fi

        if [ "$first_data" == "ETX " ] || [ "$first_data" == "EOT " ]; then
            used_clusters=$((used_clusters+1))
        elif [ "$first_data" == "SOH " ]; then
            free_clusters=$((free_clusters+1))
        elif [ "$first_data" == "STX " ]; then
            bad_clusters=$((bad_clusters+1))
        elif [ "$first_data" == "NUL " ]; then
            used_clusters=$((used_clusters+1))
        fi

        printf "%s\n" "$first_data"

        # Check if line blank
        if [ "$first_data" == "" ]; then
            break
        fi
        total_clusters=$((total_clusters+1))
        line_num=$((line_num+1))
    done

    total_used_clusters=$((used_clusters+bad_clusters))

    printf "State       Count       Percentage\n"
    printf "Used         %d           %d%%\n" "$used_clusters" "$(( (used_clusters * 100) / total_clusters ))"
    printf "Avail        %d          %d%%\n" "$free_clusters" "$(( (free_clusters * 100) / total_clusters ))"
    printf "Bad          %d           %d%%\n" "$bad_clusters" "$(( (bad_clusters * 100) / total_clusters ))"
    printf "Total number of clusters: %d\n" "$total_clusters"
    printf "Total number of used clusters: %d\n" "$total_used_clusters"

    if [ $free_clusters -eq 0 ]; then
        printf "***Disk full***\n"
    fi

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

# Interprets the file and prints out the internal value of the file on the formatted disk
function read_file(){
    printf "Reading the file...\n"
    local f # Interpreted File output for reading
    # Create a temporary directory and file
    mkdir "./temp"
    interpret_file < "$file" > "./temp/interpreted_file.txt"

    # Work on the interpreted file
    f="./temp/interpreted_file.txt"


    # Arguments: interpreted file, file to read from disk
    interpret_file_system_read_file "$f" "$1"

    # Remove temporary file
    rm "./temp/interpreted_file.txt"
    rmdir "./temp"

}

function disk_usage(){
    printf "Disk Usage:\n"
    local f # Interpreted File output for reading
    # Create a temporary directory and file
    mkdir "./temp"
    interpret_file < "$file" > "./temp/interpreted_file.txt"

    # Work on the interpreted file

    f="./temp/interpreted_file.txt"

    analyze_disk_usage < "$f"

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

        # TODO: Need to change to checking if its modulus 16 equals 0
        # Check if the line is not 64 characters long
        local line_length=${#line}
        line_length=$((line_length - 3))

        if [ $((  line_length % 16  )) -ne 0 ] && [ $i != 0 ]; then
            printf "Malformed disk file.\n"
            printf "Line %d is not a multiple of 16( >0 ) characters long.\n" "$i"
            printf "Line: %s\n" "$line"
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
                -f|--file) # File path specified
                    case "$3" in
                        -du|--disk-usage) # Analyzes and returns the disk usage
                            file=$2 # File path
                            file_check
                            malformed_check

                            disk_usage
                            ;;
                        *) # Invalid option
                            printf "Invalid option.\n"
                            exit_and_clean
                            ;;
                    esac
                    ;;
                -*|*.*) # Invalid option
                    printf "Invalid option.\n"
                    exit_and_clean
                    ;;
                *) # Create new blank disk or invalid option
                    if [[ "$1" =~ ^[a-zA-Z0-9]+$ ]]; then
                        if [[ "$2" =~ ^[0-9]+$ ]] && [[ "$3" =~ ^[0-9]+$ ]]; then
                            printf "Creating a new blank disk...\n"

                            # Check that sector count is a multiple of 16
                            if [ "$2" -eq 0 ] || [ $(( $2 % 16 )) -ne 0 ]; then
                                printf "sector count must be a multiple of 16.\n"
                                exit_and_clean
                            fi
                            
                            # Check that cluster size is a multiple of 16
                            if [ "$3" -eq 0 ] || [ $(( $3 % 16 )) -ne 0 ]; then
                                printf "cluster size must be a multiple of 16.\n"
                                exit_and_clean
                            fi

                            # Print the disk name, sector count, and cluster size
                            printf "Disk name: %s\n" "$1"
                            printf "Sector Count: %s\n" "$2"
                            printf "Cluster size: %s\n" "$3"

                            # Create the new blank disk
                            create_blank_disk "$1" "$2" "$3" >> "$1.txt"

                            exit_and_clean
                        else
                            printf "Invalid option.\n"
                            exit_and_clean
                        fi
                    else
                        printf "Invalid option.\n"
                        exit_and_clean
                    fi
                    ;;
            esac
            ;;
        4) 
            case "$1" in
                -type|-cat)
                    internal_disk_file=$2
                    case "$3" in
                        -f) # File path specified
                            
                            file=$4 # File path
                            file_check 
                            malformed_check
                            
                            read_file "$internal_disk_file"

                            exit_and_clean
                            ;;
                        *)
                            printf "Invalid option.\n"
                            exit_and_clean
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
            printf "%d arguments provided.\n" $#
            exit_and_clean
            ;;
    esac

    

}

# Start of script
printf "Script execution started.\n"

main "$@"

# End of script
exit_and_clean

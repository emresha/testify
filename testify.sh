#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

create_test_files() {
    local prefix=$1
    local count=$2
    local args_needed=$3

    # error handling for valid number
    if ! [[ "$count" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}Error: $count is not a valid number.${NC}"
        exit 1
    fi

    for i in $(seq -w 1 $count); do
        touch "${prefix}_${i}_in.txt"
        touch "${prefix}_${i}_out.txt"
        if [ "$args_needed" == "yes" ]; then
            touch "${prefix}_${i}_args.txt"
        fi
    done
}

echo -e "${YELLOW}Do you need tests with arguments? (yes/no)${NC}"
read args_needed

if [[ "$args_needed" != "yes" && "$args_needed" != "no" ]]; then
    echo -e "${RED}Error: Please enter 'yes' or 'no'.${NC}"
    exit 1
fi

echo -e "${YELLOW}How many positive tests do you need?${NC}"
read pos_count

echo -e "${YELLOW}How many negative tests do you need?${NC}"
read neg_count

if [[ -z "$pos_count" || -z "$neg_count" ]]; then
    echo -e "${RED}Error: Please provide a number for both positive and negative tests.${NC}"
    exit 1
fi

create_test_files "pos" "$pos_count" "$args_needed"

create_test_files "neg" "$neg_count" "$args_needed"

echo -e "${GREEN}Test files generated successfully.${NC}"
    
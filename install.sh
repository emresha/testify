#!/bin/bash

SCRIPT_NAME="testify"
SOURCE_SCRIPT="testify.sh"
DEFAULT_INSTALL_DIR="/usr/local/bin"

install_script() {
    if [ ! -f "$SOURCE_SCRIPT" ]; then
        echo -e "${RED}Error: Source script '$SOURCE_SCRIPT' not found.${NC}"
        exit 1
    fi

    if [ -f "$INSTALL_DIR/$SCRIPT_NAME" ]; then
        echo -e "${YELLOW}Warning: '$SCRIPT_NAME' already exists in $INSTALL_DIR. Overwriting...${NC}"
    fi

    sudo mkdir -p "$INSTALL_DIR"

    sudo mv "$SOURCE_SCRIPT" "$INSTALL_DIR/$SCRIPT_NAME"
    sudo chmod +x "$INSTALL_DIR/$SCRIPT_NAME"

    echo -e "${GREEN}Script installed successfully as '$SCRIPT_NAME'.${NC}"
}

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${YELLOW}Enter the installation directory (default is $DEFAULT_INSTALL_DIR):${NC}"
read INSTALL_DIR

INSTALL_DIR=${INSTALL_DIR:-$DEFAULT_INSTALL_DIR}

install_script

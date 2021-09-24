#!/bin/bash

# Variables
name="OATest"
author="Benedikt Fischer"
# Colors
RESET="\e[0m"
BOLD="\e[1m"
DIM="\e[2m"
ITALIC="\e[3m"
UNDERLINED="\e[4m"
BLINK="\e[5m"
INVERTED="\e[7m"
CROSSED="\e[9m"
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"
DARK_GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"


# Code
clear
echo -e "*********************************************************"
echo -e ""
echo -e "$name - Coded by $MAGENTA$author$RESET"
echo -e ""
echo -e "*********************************************************"

if (( $EUID != 0 )); then
    echo -e "$RED$DIM Please run as root $RESET"
else
	echo -e ""
	echo -e "You're root, nice!"
    
    # Paste in Code HERE!
    apt update && apt upgrade -y
    
fi

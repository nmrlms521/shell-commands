#!/bin/bash

# ================================
# COLOR CODES
# ================================
# Regular Colors
BLACK="\e[30m";  RED="\e[31m";   GREEN="\e[32m";  YELLOW="\e[33m"
BLUE="\e[34m";   MAGENTA="\e[35m"; CYAN="\e[36m"; WHITE="\e[37m"

# Bright Colors
BBLACK="\e[90m"; BRED="\e[91m";  BGREEN="\e[92m";  BYELLOW="\e[93m"
BBLUE="\e[94m";  BMAGENTA="\e[95m"; BCYAN="\e[96m"; BWHITE="\e[97m"

# Background Colors
BGBLACK="\e[40m"; BGRED="\e[41m"; BGGREEN="\e[42m"; BGYELLOW="\e[43m"
BGBLUE="\e[44m";  BGMAGENTA="\e[45m"; BGCYAN="\e[46m"; BGWHITE="\e[47m"

# Bright Background Colors
BGBBLACK="\e[100m"; BGBRED="\e[101m"; BGBGREEN="\e[102m"; BGBYELLOW="\e[103m"
BGBBLUE="\e[104m";  BGBMAGENTA="\e[105m"; BGBCYAN="\e[106m"; BGBWHITE="\e[107m"

# Styles
BOLD="\e[1m"; UNDERLINE="\e[4m"; BLINK="\e[5m"; REVERSE="\e[7m"
RESET="\e[0m"

# ================================
# COLOR DEMO SECTION
# ================================

echo -e "\n${BOLD}==== BASIC COLORS ====${RESET}"
for color in "$BLACK" "$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$WHITE"; do
    echo -e "${color}This is a sample text${RESET}"
done

echo -e "\n${BOLD}==== BRIGHT COLORS ====${RESET}"
for color in "$BBLACK" "$BRED" "$BGREEN" "$BYELLOW" "$BBLUE" "$BMAGENTA" "$BCYAN" "$BWHITE"; do
    echo -e "${color}This is a bright color text${RESET}"
done

echo -e "\n${BOLD}==== BACKGROUND COLORS ====${RESET}"
for bg in "$BGBLACK" "$BGRED" "$BGGREEN" "$BGYELLOW" "$BGBLUE" "$BGMAGENTA" "$BGCYAN" "$BGWHITE"; do
    echo -e "${bg}Background Color Sample${RESET}"
done

echo -e "\n${BOLD}==== BRIGHT BACKGROUNDS ====${RESET}"
for bg in "$BGBBLACK" "$BGBRED" "$BGBGREEN" "$BGBYELLOW" "$BGBBLUE" "$BGBMAGENTA" "$BGBCYAN" "$BGBWHITE"; do
    echo -e "${bg}Bright Background Sample${RESET}"
done

echo -e "\n${BOLD}==== STYLES ====${RESET}"
echo -e "${BOLD}Bold Text${RESET}"
echo -e "${UNDERLINE}Underlined Text${RESET}"
echo -e "${BLINK}Blinking Text (if supported)${RESET}"
echo -e "${REVERSE}Reverse Video Effect${RESET}"

echo -e "\n${BOLD}==== MIXED COMBINATIONS ====${RESET}"
echo -e "${RED}${BGYELLOW}Red on Yellow${RESET}"
echo -e "${YELLOW}${BGRED}Yellow on Red${RESET}"
echo -e "${WHITE}${BGBLUE}White on Blue${RESET}"
echo -e "${CYAN}${BGMAGENTA}Cyan on Magenta${RESET}"
echo -e "${BRED}${BGWHITE}Bright Red on Bright White${RESET}"
echo -e "${BCYAN}${BGBBLACK}Bright Cyan on Black${RESET}"
echo -e "${MAGENTA}${BGBCYAN}Magenta on Bright Cyan${RESET}"
echo -e "${BOLD}${BLUE}${BGBWHITE}Bold Blue on Bright White${RESET}"

echo -e "\n${BOLD}==== SCRIPT COMPLETED ====${RESET}"

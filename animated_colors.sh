#!/bin/bash

# ============================================================
# COLOR CODES
# ============================================================
RESET="\e[0m"
RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"; BLUE="\e[34m"
CYAN="\e[36m"; MAGENTA="\e[35m"; WHITE="\e[97m"

BOLD="\e[1m"; BLINK="\e[5m"; UNDERLINE="\e[4m"; REVERSE="\e[7m"

# ============================================================
# 1. LOADING SPINNER
# ============================================================
spinner() {
    local pid=$!
    local spin='|/-\'
    while kill -0 $pid 2>/dev/null; do
        for i in {0..3}; do
            echo -ne "\r${CYAN}Loading ${spin:$i:1}${RESET}"
            sleep 0.1
        done
    done
    echo -ne "\r${GREEN}Done!        ${RESET}\n"
}

# ============================================================
# 2. PROGRESS BAR
# ============================================================
progress_bar() {
    echo -e "${YELLOW}Progress:${RESET}"
    for i in $(seq 1 50); do
        bar=$(printf "%-${i}s" "=")
        echo -ne "\r[${GREEN}${bar}${RESET}$(printf "%-$((50-i))s")] $((i*2))%"
        sleep 0.05
    done
    echo -e "\n${GREEN}Completed!${RESET}"
}

# ============================================================
# 3. TYPING EFFECT
# ============================================================
type_effect() {
    text="$1"
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${text:$i:1}"
        sleep 0.03
    done
    echo ""
}

# ============================================================
# 4. FLASHING COLOR TEXT
# ============================================================
flash_text() {
    for i in {1..10}; do
        echo -ne "\r${RED}ALERT!${RESET}"
        sleep 0.2
        echo -ne "\r${WHITE}ALERT!${RESET}"
        sleep 0.2
    done
    echo ""
}

# ============================================================
# 5. COUNTDOWN WITH COLORS
# ============================================================
countdown() {
    echo -e "${MAGENTA}Countdown starts...${RESET}"
    for i in {5..1}; do
        echo -e "${BOLD}${CYAN}$i${RESET}"
        sleep 1
    done
    echo -e "${GREEN}GO!${RESET}"
}

# ============================================================
# 6. MAIN DEMO MENU
# ============================================================
while true; do
    echo -e "\n${BOLD}========= ANIMATION MENU =========${RESET}"
    echo "1) Loading Spinner"
    echo "2) Progress Bar"
    echo "3) Typing Effect"
    echo "4) Flashing Text"
    echo "5) Countdown"
    echo "6) Run All Animations"
    echo "7) Exit"
    echo -n "Choose: "
    read opt

    case $opt in
        1)
            (sleep 3) &
            spinner
        ;;
        2)
            progress_bar
        ;;
        3)
            type_effect "This is a typing animation in shell script..."
        ;;
        4)
            flash_text
        ;;
        5)
            countdown
        ;;
        6)
            echo -e "\n${CYAN}Running all animations...${RESET}"
            (sleep 2) & spinner
            progress_bar
            type_effect "Animations complete!"
            flash_text
            countdown
        ;;
        7) exit 0 ;;
        *)
            echo -e "${RED}Invalid option!${RESET}"
        ;;
    esac
done

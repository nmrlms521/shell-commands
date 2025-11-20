#!/bin/bash

# ============================================================
# COLOR CODES
# ============================================================
RESET="\e[0m"

# Regular Colors
BLACK="\e[30m"; RED="\e[31m"; GREEN="\e[32m"; YELLOW="\e[33m"
BLUE="\e[34m"; MAGENTA="\e[35m"; CYAN="\e[36m"; WHITE="\e[37m"

# Bright Colors
BBLACK="\e[90m"; BRED="\e[91m"; BGREEN="\e[92m"; BYELLOW="\e[93m"
BBLUE="\e[94m"; BMAGENTA="\e[95m"; BCYAN="\e[96m"; BWHITE="\e[97m"

# Background Colors
BGBLACK="\e[40m"; BGRED="\e[41m"; BGGREEN="\e[42m"; BGYELLOW="\e[43m"
BGBLUE="\e[44m"; BGMAGENTA="\e[45m"; BGCYAN="\e[46m"; BGWHITE="\e[47m"

# Bright Backgrounds
BGBBLACK="\e[100m"; BGBRED="\e[101m"; BGBGREEN="\e[102m"; BGBYELLOW="\e[103m"
BGBBLUE="\e[104m"; BGBMAGENTA="\e[105m"; BGBCYAN="\e[106m"; BGBWHITE="\e[107m"

# Text Styles
BOLD="\e[1m"; UNDERLINE="\e[4m"; BLINK="\e[5m"; REVERSE="\e[7m"


# ============================================================
# LOG MESSAGE FUNCTIONS (Reusable)
# ============================================================
success() {
    echo -e "${GREEN}[SUCCESS]${RESET} $1"
}

error() {
    echo -e "${RED}[ERROR]${RESET} $1"
}

warning() {
    echo -e "${YELLOW}[WARNING]${RESET} $1"
}

info() {
    echo -e "${CYAN}[INFO]${RESET} $1"
}


# ============================================================
# PREVIEW FUNCTIONS
# ============================================================

# 1. Basic Color Preview
show_basic_colors() {
    echo -e "\n${BOLD}=== BASIC COLORS ===${RESET}"
    for c in "$BLACK" "$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$WHITE"; do
        echo -e "${c}Sample Text${RESET}"
    done
}

# 2. Bright Color Preview
show_bright_colors() {
    echo -e "\n${BOLD}=== BRIGHT COLORS ===${RESET}"
    for c in "$BBLACK" "$BRED" "$BGREEN" "$BYELLOW" "$BBLUE" "$BMAGENTA" "$BCYAN" "$BWHITE"; do
        echo -e "${c}Sample Text${RESET}"
    done
}

# 3. Background Preview
show_backgrounds() {
    echo -e "\n${BOLD}=== BACKGROUND COLORS ===${RESET}"
    for bg in "$BGBLACK" "$BGRED" "$BGGREEN" "$BGYELLOW" "$BGBLUE" "$BGMAGENTA" "$BGCYAN" "$BGWHITE"; do
        echo -e "${bg}Background Sample${RESET}"
    done
}

# 4. Grid of all combinations (Text × Background)
show_color_grid() {
    echo -e "\n${BOLD}=== FULL COLOR GRID (Text × Background) ===${RESET}"

    text_colors=("$RED" "$GREEN" "$YELLOW" "$BLUE" "$MAGENTA" "$CYAN" "$WHITE")
    bg_colors=("$BGRED" "$BGGREEN" "$BGYELLOW" "$BGBLUE" "$BGMAGENTA" "$BGCYAN" "$BGWHITE")

    for t in "${text_colors[@]}"; do
        for bg in "${bg_colors[@]}"; do
            echo -ne "${t}${bg} TEXT_BG ${RESET} "
        done
        echo ""
    done
}

# 5. Styles Preview
show_styles() {
    echo -e "\n${BOLD}=== STYLES ===${RESET}"
    echo -e "${BOLD}Bold Text${RESET}"
    echo -e "${UNDERLINE}Underlined Text${RESET}"
    echo -e "${BLINK}Blinking Text (terminal dependent)${RESET}"
    echo -e "${REVERSE}Reverse Color Effect${RESET}"
}


# ============================================================
# INTERACTIVE MENU
# ============================================================
while true; do
    echo -e "\n${BOLD}========== COLOR MENU ==========${RESET}"
    echo "1) Basic Colors"
    echo "2) Bright Colors"
    echo "3) Background Colors"
    echo "4) Full Color Grid (Text × Background)"
    echo "5) Text Styles"
    echo "6) Test Log Functions"
    echo "7) Exit"
    echo -n "Choose option: "
    read choice

    case $choice in
        1) show_basic_colors ;;
        2) show_bright_colors ;;
        3) show_backgrounds ;;
        4) show_color_grid ;;
        5) show_styles ;;
        6)
            success "Backup completed successfully!"
            info "Fetching system information..."
            warning "Disk usage reaching 80%."
            error "Failed to connect to database."
        ;;
        7) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid choice!" ;;
    esac
done

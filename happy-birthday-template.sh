#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
BLINK='\033[5m'
NC='\033[0m'

# Function for rainbow text
rainbow_text() {
    local text="$1"
    local colors=($RED $GREEN $YELLOW $BLUE $PURPLE $CYAN)
    for (( i=0; i<${#text}; i++ )); do
        echo -ne "${colors[$((i % 6))]}${BOLD}${text:$i:1}${NC}"
    done
    echo
}

# Function for explosive sparkle animation
big_sparkle() {
    local sparkles='✨⭐'
    local party_stuff=('🎉' '🎈' '🎊' '🎂' '🎁' '🌟' '✨' '💫' '🎯' '🎪' '🎵' '🎸' '🎺' '🎷' '🎹')
    
    # First sprinkle sparkles
    for ((i=0; i<60; i++)); do
        local x=$((RANDOM % $(tput cols)))
        local y=$((RANDOM % $(tput lines)))
        tput cup $y $x
        echo -ne "${YELLOW}${BLINK}${sparkles:$((RANDOM % 7)):1}${NC}"
    done
    
    # Then add party emojis
    for ((i=0; i<30; i++)); do
        local x=$((RANDOM % $(tput cols)))
        local y=$((RANDOM % $(tput lines)))
        tput cup $y $x
        echo -ne "${BOLD}${party_stuff[$((RANDOM % ${#party_stuff[@]}))]}${NC}"
    done
}

# Super festive cake animation
show_cake() {
    echo -e "${YELLOW}${BOLD}
    🎈  🎈  🎈  
   ✨,,,,,✨   
  (∩ ͡° ͜ʖ ͡°)⊃━☆ﾟ.* 
    |🎂🎂|
    |🎂🎂| 
   ========
   🎉 🎉 🎉
   🎁 🎁 🎁
   
   To: NAME
   From: LEO ${NC}"
}

# Initial explosion of sparkles
for i in {1..5}; do
    clear
    big_sparkle
    sleep 0.3
done

# Clear and show cake with countdown
clear
for i in {3..1}; do
    clear
    show_cake
    echo -e "\n${BOLD}HEY NAME! SURPRISE IN: $i${NC}"
    sleep 0.8
done

# Show final cake
clear
show_cake
sleep 1

# Show ASCII Art Birthday Message
# Generated using https://patorjk.com/software/taag/#p=display&v=1&f=ANSI%20Shadow&t=HAPPY%0ABIRTHDAY%0ANAME%20!%20!%20!
echo -e "${BOLD}${RED}"
echo -e "
\n
\n
██╗  ██╗ █████╗ ██████╗ ██████╗ ██╗   ██╗                    
██║  ██║██╔══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝                    
███████║███████║██████╔╝██████╔╝ ╚████╔╝                     
██╔══██║██╔══██║██╔═══╝ ██╔═══╝   ╚██╔╝                      
██║  ██║██║  ██║██║     ██║        ██║                       
╚═╝  ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝        ╚═╝                       
██████╗ ██╗██████╗ ████████╗██╗  ██╗██████╗  █████╗ ██╗   ██╗
██╔══██╗██║██╔══██╗╚══██╔══╝██║  ██║██╔══██╗██╔══██╗╚██╗ ██╔╝
██████╔╝██║██████╔╝   ██║   ███████║██║  ██║███████║ ╚████╔╝ 
██╔══██╗██║██╔══██╗   ██║   ██╔══██║██║  ██║██╔══██║  ╚██╔╝  
██████╔╝██║██║  ██║   ██║   ██║  ██║██████╔╝██║  ██║   ██║   
╚═════╝ ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═════╝ ╚═╝  ╚═╝   ╚═╝   
███╗   ██╗ █████╗ ███╗   ███╗███████╗    ██╗    ██╗    ██╗   
████╗  ██║██╔══██╗████╗ ████║██╔════╝    ██║    ██║    ██║   
██╔██╗ ██║███████║██╔████╔██║█████╗      ██║    ██║    ██║   
██║╚██╗██║██╔══██║██║╚██╔╝██║██╔══╝      ╚═╝    ╚═╝    ╚═╝   
██║ ╚████║██║  ██║██║ ╚═╝ ██║███████╗    ██╗    ██╗    ██╗   
╚═╝  ╚═══╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝    ╚═╝    ╚═╝                     
                                                             
"
echo -e "${NC}"
sleep 1

# Super colorful birthday message
messages=(
    "🌟 HAPPY 🌟" 
    "🎉 BIRTHDAY 🎉" 
    "🎈 NAME! 🎈"
)

for message in "${messages[@]}"; do
    echo -ne "\n"
    rainbow_text "$message"
    sleep 0.5
done

# Function to show gift card
show_gift_card() {
    local title="$1"
    local message="$2"
    local code="$3"
    echo -e "\n${BOLD}${CYAN}┏━━━━━━━━━━ GIFT CARD ━━━━━━━━━━━┓${NC}"
    echo -e "${BOLD}${PURPLE}┃                                ┃${NC}"
    echo -e "${BOLD}${YELLOW}┃  ${title}$(printf '%*s' $((30 - ${#title}))"")┃${NC}"
    echo -e "${BOLD}${GREEN}┃  ${message}$(printf '%*s' $((30 - ${#message}))"")┃${NC}"
    echo -e "${BOLD}${RED}┃  Code: ${code}$(printf '%*s' $((24 - ${#code}))"")┃${NC}"
    echo -e "${BOLD}${BLUE}┃  Go to: giftly.com/redeem      ┃${NC}"
    echo -e "${BOLD}${PURPLE}┃                                ┃${NC}"
    echo -e "${BOLD}${CYAN}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${NC}"
    echo -e "\n"
}

# Personal message from Leo
echo -e "\n${CYAN}${BOLD}Hey NAME!${NC}"
sleep 0.5
echo -e "${PURPLE}${BOLD}Just wanted to celebrate YOU!${NC}"
sleep 0.5
echo -e "${GREEN}${BOLD}You're awesome and deserve all the cake! 🎂${NC}"

# Function to check if we're running interactively
is_interactive() {
    # Check multiple conditions for interactive mode
    if [ -t 0 ] || [ -p /dev/stdin ] || [ "${FORCE_INTERACTIVE:-0}" = "1" ]; then
        return 0
    else
        return 1
    fi
}

# Function to handle read with fallback
read_with_timeout() {
    local prompt="$1"
    local var_name="$2"
    local timeout="${3:-5}"
    
    if is_interactive; then
        read -p "$prompt" "$var_name"
    else
        read -t "$timeout" "$var_name" || true
        echo  # Add newline for non-interactive mode
    fi
}

# Prompt to continue
echo -e "\n${YELLOW}${BOLD}[Press Enter to view your gifts...]${NC}"
if is_interactive; then
    read -r || true
else
    echo -e "${YELLOW}${BOLD}[Automatically continuing in 3 seconds...]${NC}"
    sleep 3
fi

# Gift card reveal
clear
echo -e "${RAINBOW}${BOLD}=== BIRTHDAY GIFT VIEWER 00034.1 Revision 8 ===${NC}\n"
echo -e "${YELLOW}${BOLD}Unwrap your gifts by selecting options 1-3${NC}\n"

# Interactive gift reveal
revealed_gifts=()
auto_mode_count=0

while true; do
    echo -e "${PURPLE}1) First Gift"
    echo -e "2) Second Gift"
    echo -e "3) Third Gift"
    echo -e "\n[Press Enter to finish unwrapping]${NC}"
    
    if is_interactive; then
        read -n 1 -p $'\nSelect gift to unwrap (1-3 or Enter): ' choice
        echo -e "\n"
    else
        # In non-interactive mode, automatically reveal gifts in sequence
        auto_mode_count=$((auto_mode_count + 1))
        if [ $auto_mode_count -le 3 ]; then
            choice=$auto_mode_count
            echo -e "\n${YELLOW}${BOLD}[Auto-selecting gift $choice...]${NC}"
            sleep 2
        else
            choice=""
        fi
    fi
    
    # Check if gift was already revealed
    gift_already_revealed() {
        local gift_num=$1
        for revealed in "${revealed_gifts[@]}"; do
            [ "$revealed" == "$gift_num" ] && return 0
        done
        return 1
    }
    
    case $choice in
        1|2|3)
            if gift_already_revealed "$choice"; then
                if is_interactive; then
                    echo -e "${RED}${BOLD}[This gift has already been unwrapped!]${NC}\n"
                    sleep 1
                    continue
                fi
            else
                revealed_gifts+=("$choice")
                echo -e "${YELLOW}${BOLD}[Unwrapping Gift $choice...]${NC}"
                sleep 0.5
                case $choice in
                    1) show_gift_card "MERCHANT 1" "Message from Leo" "XXXXXX" ;;
                    2) show_gift_card "MERCHANT 2" "Message from Leo" "XXXXXX" ;;
                    3) show_gift_card "MERCHANT 3" "Message from Leo" "XXXXXX" ;;
                esac
            fi
            ;;
        "")
            if [ ${#revealed_gifts[@]} -eq 0 ] && is_interactive; then
                echo -e "${YELLOW}${BOLD}[You haven't unwrapped any gifts yet!]${NC}\n"
                sleep 1
                continue
            fi
            echo -e "${GREEN}${BOLD}[All gifts unwrapped successfully!]${NC}\n"
            sleep 1
            break
            ;;
        *)
            if is_interactive; then
                echo -e "${RED}${BOLD}[ERROR] Please select 1, 2, 3, or press Enter${NC}\n"
                sleep 1
            fi
            ;;
    esac
done

# Final quick celebration
clear

# Function to center text
center_text() {
    local text="$1"
    local cols=$(tput cols)
    local text_length=${#text}
    local padding=$(( (cols - text_length) / 2 ))
    printf "%${padding}s%s%${padding}s" "" "$text" ""  # Removed newline
}

# Get screen dimensions
LINES=$(tput lines)
COLS=$(tput cols)

# Fixed dimensions for layout
TEXT_START_LINE=2  # Start text near the top with a small margin
TEXT_HEIGHT=4  # Height of text section including padding
TEXT_BUFFER=2  # Extra space around text to keep clear
ANIMATION_HEIGHT=20  # Fixed height for animation section

# Define animation boundaries (excluding last line)
ANIMATION_START=$((TEXT_START_LINE + TEXT_HEIGHT + TEXT_BUFFER))
ANIMATION_END=$((ANIMATION_START + ANIMATION_HEIGHT - 3))  # End 3 lines earlier to completely hide last line

# Ensure we don't exceed terminal height
if ((ANIMATION_END >= LINES - 2)); then
    ANIMATION_END=$((LINES - 3))  # Keep two line buffer at bottom
fi

# Clear screen and hide cursor
clear
tput civis

# Move to text position
tput cup $TEXT_START_LINE 0

# First line - Happy Birthday with rainbow colors
happy_text="🎉 HAPPY BIRTHDAY NAME! 🎉"
cols=$(tput cols)
padding=$(( (cols - ${#happy_text}) / 2 ))
printf "%${padding}s" ""  # Print padding before text
colors=($RED $GREEN $YELLOW $BLUE $PURPLE $CYAN)
for (( i=0; i<${#happy_text}; i++ )); do
    echo -ne "${colors[$((i % 6))]}${BOLD}${happy_text:$i:1}${NC}"
done
echo  # Add newline after rainbow text

# Second line - Celebration message
echo -e "${BOLD}${CYAN}"
center_text "✨ Celebrating you with lots of love - Leo! ✨"
echo -e "${NC}"

# Save cursor position for animation area
tput sc

# Infinite sparkle animation
sparkles='✨⭐'
party_emojis=('🎉' '🎈' '🎊' '🎂' '🎁' '🌟' '✨' '💫')

# Run animation indefinitely
while true; do
    # Restore cursor to start of animation area
    tput rc
    
    # Clear animation area only (not the whole screen)
    for ((i=ANIMATION_START; i<=ANIMATION_END; i++)); do
        tput cup $i 0
        printf "%${COLS}s" ""
    done
    
    # Add sparkles in animation section
    for ((i=0; i<50; i++)); do
        y=$((RANDOM % (ANIMATION_END - ANIMATION_START) + ANIMATION_START))
        x=$((RANDOM % COLS))
        tput cup $y $x
        echo -ne "${YELLOW}${BOLD}${sparkles:$((RANDOM % 2)):1}${NC}"
    done
    
    # Add party emojis in animation section
    for ((i=0; i<25; i++)); do
        y=$((RANDOM % (ANIMATION_END - ANIMATION_START) + ANIMATION_START))
        x=$((RANDOM % COLS))
        tput cup $y $x
        echo -ne "${BOLD}${party_emojis[$((RANDOM % 8))]}${NC}"
    done
    
    sleep 0.1
done
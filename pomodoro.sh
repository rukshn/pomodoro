#!/bin/bash
# POMODORO in YA TerMINAL ;)


function pomo {
    RED='\033[0;31m'
    NC='\033[0m' # No Color
    ORANGE='\033[0;33m'
    printf "${ORANGE}POMODORO in YA TERMINAL${NC}\n"

    if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        echo "usage: pomo       25 minute cycle"
        echo -e "   or: pomo [break]['_message_']  see options below\n"
        echo "Options:"
        echo "  s: 05 minute break"
        echo "  l:  15 minute break"
        echo "  message: Your message to display"
        return
    fi

    if [[ "$1" == "-v" ]] || [[ "$1" == "--version" ]]; then
        echo -e "${ORANGE}POMODORO TIMER BY RUKY"
        echo "  v: 1"
        echo "  twitter: @justruky"
        echo "  blog: rukshn.github.io"
        echo -e "  email: arkruka[@]gmail.com"
        return
    fi


    TITLE="PROMODO TIMER"
    ICON="face-cool"
    BEEP="_alarm 400 200"


    if [[ "$1" == "-l" ]]; then
        if [ -n "$2" ]; then
            MESSAGE="$2"
        else
            MESSAGE="Long break over, back to work"
        fi

        TIMER=900
        echo -e "${RED}TIMER SET FOR 15 MINUTES"

    elif [[ "$1" == "-s" ]]; then
        if [ -n "$2" ]; then
            MESSAGE="$2"
        else
            MESSAGE="Short break over, back to work"
        fi

        TIMER=300
        echo -e "${RED}TIMER SET FOR 5 MINUTES"

    elif [ -n "$1" ]; then
        MESSAGE="$1"

    else
        MESSAGE="Time to take a break"
        TIMER=1500
        echo -e "${RED}TIMER SET FOR 25 MINUTES"
    fi

    # LINUX users
    if [[ "$(uname)" == "Linux" ]]; then
        eval "(sleep $TIMER && notify-send '$TITLE' '$MESSAGE' --icon=$ICON && $BEEP &)"
    # MAC users
    elif [[ "$(uname)" == "Darwin" ]]; then
        eval "(sleep $TIMER && terminal-notifier -message '$MESSAGE' -title 'Pomodoro' --subtitle '$TITLE' &)"
    else
        echo "Sorry! Only Linux or Mac";
    fi
}

_alarm() {
    ( \speaker-test --frequency $1 --test sine )&
    pid=$!
    \sleep 0.${2}s
    \kill -9 $pid
}

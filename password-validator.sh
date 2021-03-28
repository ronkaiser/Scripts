#!/bin/bash

# Environment variables definitions such as: string from the user, reasons for condition failures,
# colors and OK status.

PASS=$1
REASON=""
RED=`tput setaf 1`
GREEN=`tput setaf 2`
OK=0

# Check if string is less than 10 characters

if [ ${#PASS} -ge 10 ]; then ((OK++))
else REASON+="password does not include 10 or more characters\n"; fi

# Check if string include uppercase letters

if [[ $PASS =~ [A-Z] ]]; then ((OK++))   
else REASON+="password does not include uppercase letters\n"; fi

# Check if string include lowercase letters

if [[ $PASS =~ [a-z] ]]; then ((OK++))
else REASON+="password does not include lowercase letters\n"; fi

# Check if string include digits

if [[ $PASS =~ [0-9] ]]; then ((OK++))
else REASON+="password does not include digits\n"; fi

# Check OK status, if OK doesn't equal to 4, it means that password isn't good enough 
# since it doesn't meet the conditions above

if [ $OK == 4 ]; then echo "${GREEN}Your password is awesome!"; exit 0
else echo -e "${RED}Weak Password\n$REASON"; fi

#change test

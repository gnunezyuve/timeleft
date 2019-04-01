#!/bin/bash
source params

TOTAL=$(( $(($HOURS*60)) + $MINUTES )) 
CHECK_IN=$(cat $HOME/.config/actualDate)

EPOCH_TAKEOFF=$(( `date -d "$CHECK_IN"  +%s` + $(($TOTAL *60 )) ))

date -d @$EPOCH_TAKEOFF +"%H:%M"

#!/bin/bash

HOURS=7
MINUTES=15

TOTAL=$(( $(($HOURS*60)) + $MINUTES )) 
CHECK_IN=$(cat $HOME/.config/actualDate)

EPOCH_LEFT=$(( `date -d "$CHECK_IN" +%s` + $(( $TOTAL * 60 )) - `date +%s` ))
SECONDS_LEFT=$(( EPOCH_LEFT % 60 ))
HOURS_LEFT=$(( $EPOCH_LEFT / 60 / 60 ))
MINUTES_LEFT=$(( EPOCH_LEFT / 60  - HOURS_LEFT *60 ))

if [ $BLOCK_BUTTON -eq 3 ]; then
  notify-send "Departure: `$HOME/bin/takeoff`"
fi

if [ "$EPOCH_LEFT" -gt 0 ]; then
  date -d $HOURS_LEFT:$MINUTES_LEFT:$SECONDS_LEFT +"%_H:%M"
fi

#!/bin/bash
HOURS=7
MINUTES=15

TOTAL=$(( $(($HOURS*60)) + $MINUTES )) 
CHECK_IN=$(cat $HOME/.config/actualDate)

EPOCH_LEFT=$(( `date -d "$CHECK_IN" +%s` + $(( $TOTAL * 60 )) - `date +%s` ))


SECONDS_LEFT=$(( EPOCH_LEFT % 60 ))
HOURS_LEFT=$(( $EPOCH_LEFT / 60 / 60 ))
MINUTES_LEFT=$(( EPOCH_LEFT / 60  - HOURS_LEFT *60 ))

date -d $HOURS_LEFT:$MINUTES_LEFT:$SECONDS_LEFT +"%_H:%M:%S"

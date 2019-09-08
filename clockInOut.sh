#!/bin/sh

TIME=$(date +"%a, %b %_d -%_I:%M %p")

STATUS=$(head -n1 $1 | awk '{print $2}')

if [ "$STATUS" != "in" ];
then OUTSTATUS="in"
else OUTSTATUS="out"
fi

echo "Clock $OUTSTATUS $TIME
$(cat $1)" > $1

#!/bin/sh

TIME=$(date +"%a, %b %_d -%_I:%M %p")

STATUS=$(head -n1 $1 | awk '{print $2}')

if [ "$STATUS" != "in" ];
then STATUS="in "
else STATUS="out"
fi

echo "Clock $STATUS $TIME
$(cat $1)" > $1

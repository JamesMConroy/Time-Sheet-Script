#!/bin/sh
# A script to keep track of clocking in and out of work

TIME=$(date +"%a, %b %_d -%_I:%M %p")

# Check to see if $1 exists
if [ -f $1 ]
then
	# Get the second word at the head of file
	STATUS=$(head -n1 $1 | awk '{print $2}')

	# Set the status based on it's current state.
	if [ "$STATUS" != "in" ];
	then STATUS="in "
	else STATUS="out"
	fi
else
	STSTUS="out"
fi

# Insert output to the head of the file
echo "Clock $STATUS $TIME
$(cat $1)" > $1

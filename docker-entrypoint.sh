#!/bin/bash

CONFIG_FILENAME="$1"

cd /waves

if [ -z "$1" ]
then
	echo "No configuration file name was provided, node will start with default configuration file."
	java -jar waves.jar waves.conf
else
	if [ ! -f /conf/${CONFIG_FILENAME} ]
	then
		echo "Configuration file '/conf/${CONFIG_FILENAME}' not found, aborting!"
		exit 1
	else
		echo "Starting with provided configuration '/conf/${CONFIG_FILENAME}'."
		java -jar waves.jar /conf/${CONFIG_FILENAME}
	fi
fi

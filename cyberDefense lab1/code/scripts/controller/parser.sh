#!/bin/bash
a=$(<result.txt)
if [ $a -gt 270 ];
	then
		echo "server attacked!"
		source controllerExecute.sh
else
	echo "no attack yet!"
fi


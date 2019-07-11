#!/bin/bash
ssh root@pcvm2-10.geni.it.cornell.edu 'source analyzer.sh'
while true
do
a=$(<result.txt)
if [ $a -gt 270 ];
	then
		echo "server attacked!"
		source controllerExecute.sh
		break
else
	echo "no attack yet!"
	ssh root@pcvm2-10.geni.it.cornell.edu 'source analyzer.sh'
fi
done

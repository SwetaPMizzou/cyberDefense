#!/bin/bash
a=$(wc -l < capture.csv)
echo $a
IP=$(sort capture.csv |uniq -c | sort -n -r| awk 'NR==1 {prev=$1} $1!=prev {exit} 1' |sed 's/^ *[0-9]\{1,\} //'| sed 's/,.*//')
echo $IP
if [ $a > 270 ]; then
   echo "server attacked!"

   mysql --user=monty --password=some_pass --host=192.122.236.122 test<< EOF
   INSERT INTO blacklist (blacklist_ip) VALUES ('${IP}'); 
EOF
else
   echo "no attack yet!"
fi


#!/bin/bash

python ipparser.py > ipaddress.txt 
scp ipaddress.txt root@192.122.236.101:/var/www/html/

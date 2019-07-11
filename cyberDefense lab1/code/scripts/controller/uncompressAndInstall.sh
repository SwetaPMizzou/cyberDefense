#!/bin/bash

# Change directory to /var
cd /var/

# Untar and merge uncompressed directory contents with local /var/www (server) 
tar xzvf $COMPRESSEDFILE -C /var/www --strip-components=1

# Set permissions
sudo chown www-data:www-data -R /var/www/html/BasicStreamingService

# Remove attack flag
sudo rm -f /var/www/html/BasicStreamingService/attacked.txt

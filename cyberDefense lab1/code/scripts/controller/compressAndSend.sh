
# Script to compress and send server contents over to new machine

# Change directory to /var                                                                                                                                              
cd /var                                   

touch /var/www/html/attacked.txt                                                                                                                                                                        

# Compress the server files                                                                                                                                             
tar czvf /root/$COMPRESSEDFILE www
echo "/var/www is compressed. Tarball stored as /root/apacheGENI.tgz"

# Send the compressed file to new machine over ssh
scp /root/$COMPRESSEDFILE root@$DESTINATION:/var/
echo "SCPed to $DESTINATION:/var/"

# Execute the locally present uncompressAndInstall.sh script on target machine, by pipelining through ssh
#cat /root/uncompressAndInstall.sh | ssh root@$DESTINATION bash

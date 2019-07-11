#!/bin/bash

$(cat setVariables.sh)

echo "Setting source and destination variables at SOURCE=$SOURCE"
#cat /root/setVariables.sh | ssh root@$SOURCE bash

echo "Executing compression scipt at SOURCE=$SOURCE"
echo "$(cat setVariables.sh) && $(cat compressAndSend.sh)" | ssh root@$SOURCE bash

echo SOURCE=$SOURCE
echo DESTINATION=$DESTINATION

# Execute the locally present uncompressAndInstall.sh script on target machine, by pipelining through ssh
echo "Uncompressing at DESTINATION=$DESTINATION"
echo "$(cat setVariables.sh) && $(cat uncompressAndInstall.sh)" | ssh root@$DESTINATION bash

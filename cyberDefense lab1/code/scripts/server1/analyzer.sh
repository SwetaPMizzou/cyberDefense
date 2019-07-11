
#!/bin/bash
$(cat variableassign.sh)
netstat -anp | grep :80 | grep ESTABLISHED | wc -l > result.txt
scp result.txt root@$SOURCE:~


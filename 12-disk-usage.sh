#!/bin/bash
df -hT | grep -v Filesystem | aws '{print $6F}' | cut -d "%" -f1
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_LIMIT=60
MSG=""

while IFS=read line
do
    USAGE=$(echo $line | aws '{print $6F}' | cut -d "%" -f1 )
    PARTITIONS=$(echo $line | aws '{print 7F}')
    if [ $USAGE -ge $DISK_LIMIT ]
    then    
        MSG+="High Disk Usage on $PARTITIONS : $USAGE % <br> "
    fi

done <<< $DISK_USAGE
#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SCRIPT_PATH=$PWD
SOURCE_DIR=$1
DEST_DIR=$2

LOG_FOLDER="/var/log/shell-practice"
SCRIPT_FILE=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$SCRIPT_FILE.log"

mkdir -p $LOG_FOLDER

echo "Script started executing at: $(date)" | tee -a $LOG_FILE

# root Privileges checking
if [ $USERID -eq 0 ]
then
    echo -e "$Y you are running with root access $N"   | tee -a $LOG_FILE
else
    echo -e " $R ERROR : Please run the Script with root Access $N"  | tee -a $LOG_FILE
    exit 1
fi

# validate function to check last execution is successes or failure
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is $G SUCCESSFUL $N"  | tee -a $LOG_FILE
    else
        echo -e "$2 is $R FAILURE $N"   | tee -a $LOG_FILE
        exit 1
    fi
}
FILES_TO_DELETE=$(find . -name "*.log" -mtime +14 )
while IFS=read -r filepath
do
    rm -rf $filepath
done <<< $FILES_TO_DELETE.

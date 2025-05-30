#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SCRIPT_PATH=$PWD
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

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

# to check command line argument passing or not
if [ $# -lt 2]
then
    USAGE
fi

# USAGE FUNCTION
USAGE(){
    echo -e "$R USAGE :: $N sh $0 <SOURCE-DIR> <DESTINATION-DIR> DAYS(Optional)"
}

#Destination directory existing or not 
if [ ! -d $DEST_DIR ]
then 
    echo -e "$R Destination Directory $DEST_DIR does not exist Please Check $N"
    exit 1
fi

#Source directory existing or not 
if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$R Source Directory $SOURCE_DIR does not exist Please Check $N"
    exit 1
fi

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS )  
if [ if ! -z $FILES_TO_DELETE ]
then
    echo "Files to Zip are : $FILES_TO_DELETE "
    TIME_STAMP=$(date +%F-%H-%M-%S)
    ZIP_FILE="$DEST_DIR/app_logs_$TIME_STAMP.zip"
    echo $FILES_TO_DELETE | zip @ $ZIP_FILE
    if [ -f $ZIP_FILE ]
    then
        echo -e "Successfully Created Zip file"
        while IFS= read -r filepath
        do
            echo "Deleting file : $filepath " | tee -a $LOG_FILE
            rm -rf $filepath
        done <<< $FILES_TO_DELETE
        echo -e "Log files older than $DAYS from source directory removed...$G SUCCESS $N"
    else 
        echo -e "ZIP file creation...$R FAILURE $N"
        exit 1
    fi
else
    echo -e "no log files found older than 14 days ....$Y SKIPPING $N"
fi
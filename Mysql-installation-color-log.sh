#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SCRIPT_PATH=$PWD

LOG_FOLDER="/var/log/shell-practice"
FILE=$( echo $0 | cut -d "." -f1)
LOG_FILE="$LOG_FOLDER/$FILE.log"

mkdir -p $LOG_FOLDER

echo "Script started executing at: $(date)" &>>$LOG_FILE

# root Privileges checking
if [ $USERID -eq 0 ]
then
    echo -e "$Y you are running with root access $N"  &>>$LOG_FILE
else
    echo -e " $R Please run the Script with root Access $N" &>>$LOG_FILE
    exit 1
fi

# validate function to check last execution is successes or failure
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is $G SUCCESSFUL $N" &>>$LOG_FILE
    else
        echo -e "$2 is $R FAILURE $N"  &>>$LOG_FILE
        exit 1
    fi
}

# mysql of installation, if not installed need to install
dnf list installed mysql   &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed, $R we need to install $N"
    dnf install mysql -y  &>>$LOG_FILE
    VALIDATE $? "Mysql installation"
else
    echo -e " $Y mysql is already installed nothing to do $N"  &>>$LOG_FILE
fi



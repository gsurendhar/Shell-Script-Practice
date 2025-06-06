#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SCRIPT_PATH=$PWD
PACKAGES=("mysql" "python3" "nginx" "httpd" "git")

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

# for loop is using to install multiple packages
# for packages in ${PACKAGES[@]}
for packages in $@
do
# $packages of installation, if not installed need to install
    dnf list installed $packages   &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo -e "$packages  is not installed, $R we need to install $N"   | tee -a $LOG_FILE
        dnf install $packages  -y  &>>$LOG_FILE
        VALIDATE $? "$packages  installation"
    else
        echo -e " $Y $packages  is already installed nothing to do $N"   | tee -a $LOG_FILE
    fi
done


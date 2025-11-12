#!/bin/bash
USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "/" -f1)
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "Script started executing at : $TIMESTAMP "
if [ $USERID -ne 0 ]; then
    echo -e "$R Please run this script with root access."
    exit 1
fi

#function
VALIDATE() {
    if [ $1 -ne 0 ]; then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else    
        echo -e "$2...$G SUCCESS $N"
}

dnf list installed $1  
if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed, $R we need to install $N"   
    dnf install $1 -y  
    VALIDATE $? "$1 installation"
else
    echo -e " $G mysql is already installed nothing to do $N"  
fi
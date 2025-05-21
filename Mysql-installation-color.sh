#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SCRIPT_PATH=$PWD


# root Privileges checking
if [ $USERID -eq 0 ]
then
    echo -e "$Y you are running with root access $N"
else
    echo -e " $R Please run the Script with root Access $N"
    exit 1
fi

# validate function to check last execution is successes or failure
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo -e "$2 is $G SUCCESSFUL $N"
    else
        echo -e "$2 is $R FAILURE $N"
        exit 1
    fi
}

# mysql of installation, if not installed need to install
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "Mysql is not installed, $R we need to install $N"
    dnf install mysql -y
    VALIDATE $? "Mysql installation"
else
    echo -e " $Y mysql is already installed nothing to do $N"
fi



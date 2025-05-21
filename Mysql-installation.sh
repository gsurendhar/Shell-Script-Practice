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
    echo "you are running with root access"
else
    echo "Please run the Script with root Access"
    exit 1
fi

# validate function to check last execution is successes or failure
VALIDATE() {
    if [ $1 -eq 0 ]
    then 
        echo "$2 is SUCCESSFUL"
    else
        echo "$2 is FAILURE"
        exit 1
    fi
}

# mysql of installation, if not installed need to install
dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "Mysql is not installed, we need to install"
    dnf install mysql -y
    VALIDATE $? "Mysql installation"
else
    echo "mysql is already installed nothing to do"
fi



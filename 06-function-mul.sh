#!/bin/bash
USER=$(id -u)

#  checking root user login or not 
if [ $USER -eq 0 ]
then
    echo "you are already running with root access "
else
    echo "Please run with root access "
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo " $2 is installed Successfully"
    else
        echo " $2 installation Failure"
        exit 1
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo "MySql is not installed,  Installing Mysql"
        
    dnf install mysql -y

    VALIDATE $? "mysql"


else
    echo " MySql is already installed, nothing to do "
    #exit1
fi



dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed,  Installing python"
        
    dnf install python3 -y

    VALIDATE $? "python3"


else
    echo " python3 is already installed, nothing to do "
    #exit1
fi




dnf list installed nginx
if [ $? -ne 0 ]
then
    echo "nginx is not installed,  Installing Mysql"
        
    dnf install nginx -y

    VALIDATE $? "nginx"


else
    echo " nginx is already installed, nothing to do "
    #exit1
fi





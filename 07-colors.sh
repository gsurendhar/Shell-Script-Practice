#!/bin/bash
echo -e "\e[31m Hello Colorful world \e[0m"
echo Hello world

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
B="\e[34m"



#!/bin/bash
USER=$(id -u)

#  checking root user login or not 
if [ $USER -eq 0 ]
then
    echo "you are already running with root access "
else
    echo -e "$R Please run with root access $N "
    exit 1
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e " $2 is installed $G Successfully $N"
    else
        echo -e " $2 installation $R Failure $N "
        exit 1
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]
then
    echo -e "MySql is not installed,  $B Installing Mysql $N"
        
    dnf install mysql -y

    VALIDATE $? "mysql"


else
    echo -e " $Y MySql is already installed,$N nothing to do "
    exit1
fi



dnf list installed python
if [ $? -ne 0 ]
then
    echo -e "python is not installed,  $B Installing python $N"
        
    dnf install python -y

    VALIDATE $? "python"


else
    echo -e " $Y python is already installed, $N nothing to do "
    exit1
fi




dnf list installed nginx
if [ $? -ne 0 ]
then
    echo -e "nginx is not installed,  $B Installing nginx $N "
        
    dnf install nginx -y

    VALIDATE $? "nginx"


else
    echo -e " $Y nginx is already installed, $N nothing to do "
    exit1
fi





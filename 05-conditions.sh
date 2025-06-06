#!/bin/bash
USER=$(id -u)

#  checking root user login or not 
if [ $USER -eq 0 ]
then
    echo "you are already running with root access "


    dnf list installed mysql
    if [ $? -ne 0 ]
    then
        echo "MySql is not installed,  Installing Mysql"
        dnf install mysql -y

        if [ $? -eq 0 ]
        then
            echo " MySql is installed Successfully"
        else
            echo " MySql installation Failure"
            exit 1
        fi


    else
        echo " MySql is already installed, nothing to do "
        
    fi

else
    echo "Please run with root access "
    exit 1
fi

# dnf list installed mysql
# if [ $? -ne 0 ]
# then
#     echo "MySql is not installed,  Installing Mysql"
#     dnf install mysql -y
# else
#     echo " MySql is already installed, nothing to do "
#     exit1
# fi
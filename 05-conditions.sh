#!/bin/bash
USER=$(id -u)
if [ $USER -eq 0 ]
then
    echo "you are already runing with root access "


else
    echo "Please run with root access "
fi
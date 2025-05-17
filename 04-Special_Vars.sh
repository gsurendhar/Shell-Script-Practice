#!/bin/bash
NUM=150
NUM1=250

echo "all variables passed to the script : $@"
echo "number of variables : $#"
echo "script name : $0"
echo "current working directory : $PWD"
echo "user running the Script : $USER"
echo "home directort of user : $HOME"
echo "PID of the script : $$"

sleep 10 &
echo "PID of last command in background : $!"
echo "$1 , $2, $3 , $NUM , $NUM1"
echo "$* === $@"
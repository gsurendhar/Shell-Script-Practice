#!/bin/bash 
#sum of two variables
NUM1=100
NUM2=200
SUM=$(($NUM1+$NUM2))
echo "Sum of $NUM1 and $NUM2 is $SUM"


# sum of two variables, variables passing while executing script in command
NUM1=$1
NUM2=$2
SUM1=$(($NUM1+$NUM2))
echo "Sum of $NUM1 and $NUM2 is $SUM1"


# sum of two variables,  variables passing while executing script(dynamic)
echo "please enter number1 value"
read NUM1
echo "please enter number2 value"
read NUM2
SUM2=$(($NUM1+$NUM2))
echo "Sum of $NUM1 and $NUM2 is $SUM2"

# sum of two variables,  variables passing while executing script(dynamic) with invisible
echo "please enter number1 value"
read -s NUM1
echo "please enter number2 value"
read -s NUM2
SUM3=$(($NUM1+$NUM2))
echo "Sum of $NUM1 and $NUM2 is $SUM3"
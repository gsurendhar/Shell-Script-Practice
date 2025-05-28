#!/bin/bash
NUM=8

while [ $NUM -lt 100 ]
do
    echo $NUM
    NUM=$((NUM+1))
done

while [ $NUM -lt 200 ]
do
    echo $NUM
    NUM=`expr $NUM + 1 `
done
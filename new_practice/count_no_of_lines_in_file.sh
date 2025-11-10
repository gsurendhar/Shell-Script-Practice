#!/bin/bash
file= "$1"
if [ ! -f "$file"];
then
    echo "$file doesn't exist please provide correct file" >&2
    exit 1
fi
wc -l < "$file"
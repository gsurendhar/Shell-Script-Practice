#!/bin/bash
dir= "${1:-.}"
for f in "$dir"/* ;
do 
    [ -e $f ] || continue
    echo "Found : $f"
done

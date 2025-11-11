#!/bin/bash 
to="$1"; subj="$2"; body="$3" 
{ 
    echo "Subject: $subj"
    echo
    echo "$body"
} | sendmail "$to"
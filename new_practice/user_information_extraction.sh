#!/bin/bash
file=/etc/passwd

# check for file exists
if [ ! -f "$file" ]; then
    echo "Source file: $file doesn't exist."
    exit 1
fi 

while IFS=":" read -r username password user_id group_id;
do
    echo "Username: $username"
    echo "Password: $password"
    echo "User ID: $user_id"
    echo "Group ID: $group_id"
done < "$file"
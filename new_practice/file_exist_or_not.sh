 #!/bin/bash 
file="$1" 
if [ -f "$file" ]; 
then 
    echo "File exists: $file" 
else 
    echo "File not found: $file" 
fi
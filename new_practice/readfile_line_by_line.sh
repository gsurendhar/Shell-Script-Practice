 #!/bin/bash 
file="$1" 
while IFS= read -r line; do
    echo "Line: $line"
 done < "$file"
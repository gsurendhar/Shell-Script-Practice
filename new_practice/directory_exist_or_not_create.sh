 #!/bin/bash
 dir="$1" 
 if [ -d "$dir" ]; 
then 
    echo "Directory exists: $dir" 
else 
    mkdir -p "$dir"
    echo "Directory created: $dir" 
fi
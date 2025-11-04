 #!/bin/bash 
cmd="$1"
 if command -v "$cmd" >/dev/null 2>&1; then 
     echo "$cmd is installed" 
else 
      echo "$cmd not found. Try: sudo apt-get install $cmd" 
fi
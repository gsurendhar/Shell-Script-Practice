 #!/bin/bash 
log="/var/log/myapp.log" 
if [ -f "$log" ]; then 
    mv "$log" "${log}.$(date +%F-%H%M%S)" 
    : > "$log" 
    echo "Rotated $log" 
fi
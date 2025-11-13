 #!/bin/bash
  df -h | awk 'NR>1 && int($5) > 80 {print $6 " is " $5 " full"}'
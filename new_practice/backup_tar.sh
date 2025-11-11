#!/bin/bash 
src="${1:-.}" 
dest="${2:-/tmp/backup-$(date +%F).tar.gz}" 
tar -czf "$dest" -C "$(dirname "$src")" "$(basename "$src")" 
echo "Saved: $dest"
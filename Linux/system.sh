#!/bin/bash

echo "Free memory on the system:" > free_mem.txt
free -h >> free_mem.txt

echo "System disk usage:" > disk_usage.txt
sudo du -h /  >> disk_usage.txt

echo "Current processes running on the system:" > open_list.txt
lsof /dev/null >> open_list.txt

echo "Disk space:" > free_disk.txt
df -ah >> free_disk.txt

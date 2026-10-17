#!/bin/bash

echo "=================================="
echo "       EC2 SERVER MONITOR"
echo "=================================="

echo ""
echo "Date and Time:"
date

echo ""
echo "----- SERVICE STATUS -----"
systemctl is-active ssh

echo ""
echo "----- CPU USAGE -----"
top -bn1 | head -n 5

echo ""
echo "----- MEMORY USAGE -----"
free -h

echo ""
echo "----- DISK USAGE -----"
df -h

echo ""
echo "=================================="
echo "       MONITORING COMPLETE"
echo "=================================="

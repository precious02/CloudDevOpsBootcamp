#!/bin/bash
username=$1
if grep -q "^$username:" /etc/passwd; then
    echo "User $username exists"
    exit 0
else
    echo "User $username not found"
    exit 1
fi
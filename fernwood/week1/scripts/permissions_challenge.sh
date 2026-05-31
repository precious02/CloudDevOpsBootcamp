#!/bin/bash

echo "Create permissions challenge files"

touch precious.txt precious2.txt

chmod 755 precious.txt
chmod 644 precious2.txt

echo "Current  permissions:"

ls -l

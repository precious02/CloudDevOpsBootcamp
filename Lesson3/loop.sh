#!/bin/bash

for i in 1 2 3 4 5; do
    echo "number $i"
done


for i in $(seq 1 100); do
    echo "number $i"
done

count=2
while [ $count -le 5 ]; do
    echo "count: $count"
((count++))
done

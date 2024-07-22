#!/bin/bash

check_file() {
    if [ -x "$1" ]; then
        "$1"
    else
        echo "Error: $1 not found or not executable."
    fi
}
./cb -test zerorob -listsize 33554432  -iterations 5000000 >  ./result/zerorobResult.txt
./cb -test rob -listsize 33554432  -iterations 5000000 >  ./result/robResult.txt
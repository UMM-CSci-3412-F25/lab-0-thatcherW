#!/usr/bin/env bash

num="$1"

tar -xzf NthPrime.tgz
#ls
cd "NthPrime" || exit 1
#ls
#echo ""
gcc ./*.c -o NthPrime
#ls

./NthPrime "$num"

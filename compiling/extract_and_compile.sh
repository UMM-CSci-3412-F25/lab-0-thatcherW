#!/usr/bin/env bash

num="$1"
dest_dir="./NthPrime"
mkdir -p "$dest_dir"
home=$(pwd)

tar -xzf NthPrime.tgz -C "$dest_dir"
#ls
cd "$dest_dir" || exit 1
#ls
cd "NthPrime" || exit 1
#ls
#echo ""
gcc ./*.c -o NthPrime
#ls

./NthPrime "$num"

cd "$home" || exit 1
rm -rf "NthPrime"
#ls

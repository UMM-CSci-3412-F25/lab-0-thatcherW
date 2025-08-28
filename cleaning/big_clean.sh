#!/usr/bin/env bash

tar_file="$1"
SCRATCH=$(mktemp -d)

tar -zxf "$tar_file" --directory="$SCRATCH"

home=$(pwd)
base=$(basename "$tar_file" .tgz)
cd "$SCRATCH" || exit
ls

#echo ""
#echo "Beginning deletion"
grep -rl "DELETE ME!" "$SCRATCH/$base" | xargs rm

#echo ""
#echo "Files deleted"
ls

tar -czf "$home/cleaned_${base}.tgz" -C "$SCRATCH" "$base"
cd "$home" || exit
#ls
#tar -ztf cleaned_little_dir.tgz


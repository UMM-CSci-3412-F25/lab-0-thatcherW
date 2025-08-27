#!/usr/bin/env bash

tar_file="$1"
SCRATCH=$(mktemp -d)

top_dir=$(tar -tzf "$tar_file" | head -1 | cut -d/ -f1)
tar -zxf "$tar_file" --directory="$SCRATCH"

here=$(pwd)
cd "$SCRATCH" || exit
#ls
cd "$top_dir" || exit
ls
dirname=$(basename "$top_dir")

echo ""
echo "Beginning deletion"
grep -rl "DELETE ME!" "$SCRATCH/$top_dir" | xargs rm

echo ""
echo "Files deleted"
ls

tar -czf "$here/cleaned_$dirname.tgz" -C "$SCRATCH" "$top_dir"
cd "$here" || exit
#ls
tar -ztf cleaned_little_dir.tgz


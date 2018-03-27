#!/usr/bin/env sh

for dir in */;
	do 
		[ -d $dir ] && cd "$dir" && echo "Entering into $dir and pulling latest change if possible"
		git pull origin || true
     	cd ..
done;
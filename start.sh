#!/bin/bash
set -o errexit

echo $GHOST_INSTALL
echo $GHOST_CONTENT
baseDir="$GHOST_INSTALL/content.orig"
	for src in "$baseDir"/*/ "$baseDir"/themes/*; do
		src="${src%/}"
		target="$GHOST_CONTENT/${src#$baseDir/}"
		echo $target
		mkdir -p "$(dirname "$target")"
		if [ ! -e "$target" ]; then
		        echo "HERE HEAR"
			tar -cC "$(dirname "$src")" "$(basename "$src")" | tar -xC "$(dirname "$target")"
		fi
	done

# update the URL
node updateConfig.js

node current/index.js

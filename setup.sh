#! /bin/bash

SCRIPT=$(readlink -f "$0")

Self=`basename $0`
Basedir=`dirname $SCRIPT`
echo "=== Script Location $SCRIPT"

echo "=== enter base directory $Basedir"
cd $Basedir
echo '=== set symlinks'
function create_symlinks() {
	for file in *; do
	  if [ -d $file ]; then
		if [ "$file" != "." ] && [ "$file" != ".." ]; then
			(cd $file; create_symlinks)
		fi
	  else
		if [ "$file" != "$Self" ]; then
#		    echo "ln -s `pwd`/$file ~/.`basename $file`"
		    ln -s `pwd`/$file ~/.`basename $file`
		fi
	  fi
	done
}

create_symlinks

#!/bin/bash
#
#grep.sh
#
sgrep() {
if [ $# -ne 2 ]; then
	echo "Error: argument error"
	echo "Usage: $0 pattern file"
	exit 1
fi

PAT=$1; shift

files=`ls $1`
for i in $files 
do
	if [ -f $i ]; then
		sed  -n "/$PAT/p" $i
	else
		echo "$i is not a normal file."
	fi
done
}

sgrep 'BEGIN' ./

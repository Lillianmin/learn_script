#!/bin/bash
#acount awk
#
#awk -F: '{print $NF ;}' acount.txt
#Argument defined by user don't need to add $.
#$1=="B". Do not forget "" !! And it's == Not = !!!!
#printf Don't need (), distinct with C.
awk -F: '
	$1=="B" {
		BAL = $NF ;
		next; 
	}
	$1=="M" {
		MIN = $NF;
		next;
	}
	$1=="D" {
		BAL += $NF ;
	}
	($1=="C") || ($1=="W") {
		BAL -= $NF ;
	}
	($1=="D") || ($1=="C") || ($1=="W") {
		printf "%-10s\t%8.2f", $2, BAL;
		if(BAL<MIN)
			printf " *Below Min";
		printf "\n";
	}
	END {
		printf "-\n%-10s\t%8.2f\n", "Total", BAL;
	}
'  acount.txt



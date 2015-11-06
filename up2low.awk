#
#awk script, rename file
#
BEGIN{
	}

{
	isdir="[ -d "$1" ]"
	if(system(isdir)==0){
	print $1" is dir."
	next
	} else if($1==$2){
	print $1" is already lower case."
	next
	}else{
	mvname="mv -f "$1" "$2
	system(mvname)
	}
}

END{
	}

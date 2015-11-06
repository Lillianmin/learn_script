# Linux Shell Scripting Tutorial v1.05r3, Summer-2002
# rename.awk : awk script to rename file with some builtin Intelligence
# Author : Vivek G. Gite <vivek@nixcraft.com> 
# 
BEGIN{
	}

	#
	# main logic is here
	#
	{
		isdir1 = "[ -d " $1 " ] "
		isdir2 = "[ -d " $2 " ] " 

		scriptname1 = "low2up"
		awkscriptname1 = "rename.awk"
		
		scriptname2 = "up2low"
		awkscriptname2 = "up2low.awk"

		sfile = $1
		dfile = $2
		#
		# we are not suppose to rename dirs in source or destination
		#

		#
		# make sure we are renaming our self if in same dir
		#
		if ( sfile == scriptname1 || sfile == awkscriptname1 ||
		     sfile == scriptname2 || sfile == awkscriptname2)
			next
		else if( ( system(isdir1) ) == 0 || system((isdir2)) == 0 )
		{
			printf "%s or %s is directory can't rename it to lower case\n",sfile,dfile
			next # continue with next recored 
		}
		else if ( sfile == dfile )
		{
			printf "Skiping, \"%s\" is alrady in uppercase\n",sfile
			next
		}
		else # everythink is okay rename it to uppercase
		{
			mvcmd = "mv " sfile " " dfile
			printf "Renaming %s to %s\n",sfile,dfile
			system(mvcmd)
		}
	}

	#
	# End action, if any, e.g. clean ups 
	#
	END{
		}



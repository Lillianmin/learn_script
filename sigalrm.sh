#!/bin/sh
#
#Alarm signal handle
#
#set -n syntax check
#set -v read lines
#set -x show argument 

InteruptHandler() {
	echo "Interupted."
	KillSubProcs
	exit 2
}
AlarmHandler() {
	echo "Got SIGALRM, cmd took too long."
	KillSubProcs
	exit 14
}

KillSubProcs() {
	kill ${CHPROCIDS:-$!}
	if [ $? -eq 0 ];then 
		echo "Sub-processed killed."
	fi
}

SetTimer() {
	DEF_TOUT=${1:-10}
	if [ $DEF_TOUT -ne 0 ]; then
		sleep $DEF_TOUT && kill -s 14 $$ &
		CHPROCIDS="$CHPROCIDS $!"
		TIMERPROC=$!
	fi
}

UnsetTimer() {
	kill $TIMERPROC
}

#main()
trap AlarmHandler 14
trap InteruptHandler 2
SetTimer 15
PROG="sh ./ginfo"
$PROG &
CHPROCIDS="$CHPROCIDS $!"
wait $!
UnsetTimer
echo "All Done."
exit 0

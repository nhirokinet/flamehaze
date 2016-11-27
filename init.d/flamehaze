#!/bin/bash
# kFreeBSD do not accept scripts as interpreters, using #!/bin/sh and sourcing.
#if [ true != "$INIT_D_SCRIPT_SOURCED" ] ; then
#    set "$0" "$@"; INIT_D_SCRIPT_SOURCED=true . /lib/init/init-d-script
#fi

### BEGIN INIT INFO
# Provides:          flamehaze
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: <Enter a short description of the software>
# Description:       <Enter a long description of the software>
#                    <...>
#                    <...>
### END INIT INFO

# Author: nhirokinet <nhirokinet@nhiroki.net>

DESC="flamehaze"
DAEMON=/usr/bin/flamehaze

# This is an example to start a single forking daemon capable of writing
# a pid file. To get other behaviors, implement do_start(), do_stop() or
# other functions to override the defaults in /lib/init/init-d-script.
# See also init-d-script(5)

. /etc/default/flamehaze

start_service() {
	if [ -f $FLAMEHAZE_PID_FILE ]
	then
		pid=$(cat $FLAMEHAZE_PID_FILE)
		if [ -d /proc/$pid ]
		then
			echo Already Running \(pid: $pid\)
			return 1
		else
			rm $FLAMEHAZE_PID_FILE
		fi
	fi

	pid=$(sudo -E -H -u $FLAMEHAZE_USER /bin/bash -c 'python /usr/bin/flamehaze >/dev/null &
			echo $!')

	if [ "$pid" = "" ]
	then
		echo Starting flamehaze failed
		return 1
	fi

	echo $pid > $FLAMEHAZE_PID_FILE
	echo Starting flamehaze on PID $pid
}

stop_service() {
	if [ -f $FLAMEHAZE_PID_FILE ]
	then
		pid=$(cat $FLAMEHAZE_PID_FILE)
		if [ -d /proc/$pid ]
		then
			echo Stopping flamehaze
			kill -9 $pid
			rm $FLAMEHAZE_PID_FILE
			return 0
		else
			echo PID file exists\, but process not running
			echo Removing PID file
			rm $FLAMEHAZE_PID_FILE
			return 1
		fi
	fi

	echo Flamehaze not running
	return 1
}

display_status() {
	if [ -f $FLAMEHAZE_PID_FILE ]
	then
		pid=$(cat $FLAMEHAZE_PID_FILE)

		if [ -d /proc/$pid ]
		then
			echo Flamehaze running \( pid: $pid \)
		else
			echo Flamehaze: pid file exists, but not running \( pid: $pid \)
		fi
	else
		echo Flamehaze not running
	fi
}

case "$1" in
	start)
		start_service
		;;
	stop)
		stop_service
		;;
	restart)
		stop_service
		start_service
		;;
	status)
		display_status
		;;
	*)
		echo usage: $0 "{start|stop|restart}"
		exit 1
esac	

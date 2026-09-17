#!/bin/sh
# case-timer.sh: a minimal timer for a practice case. POSIX sh, no dependencies.
#
#   sh bin/case-timer.sh start    record the start time
#   sh bin/case-timer.sh status   print elapsed and remaining minutes
#   sh bin/case-timer.sh stop     print the final time and clear the timer
#
# The start time is stored in ./fde-case/.timer. Set LIMIT to change the
# limit in minutes (default 45).

LIMIT="${LIMIT:-45}"
DIR="./fde-case"
FILE="$DIR/.timer"

elapsed() {
  start=$(cat "$FILE")
  now=$(date +%s)
  echo $(( (now - start) / 60 ))
}

case "$1" in
  start)
    mkdir -p "$DIR"
    date +%s > "$FILE"
    echo "Started at $(date +%H:%M). Limit: $LIMIT minutes."
    ;;
  status|stop)
    if [ ! -f "$FILE" ]; then
      echo "No timer running. Use: sh $0 start" >&2
      exit 1
    fi
    m=$(elapsed)
    if [ "$m" -le "$LIMIT" ]; then
      echo "Elapsed: $m min. Remaining: $(( LIMIT - m )) min."
    else
      echo "Elapsed: $m min. Over the limit by $(( m - LIMIT )) min."
    fi
    if [ "$1" = "stop" ]; then
      rm -f "$FILE"
    fi
    ;;
  *)
    echo "Usage: sh $0 start|status|stop" >&2
    exit 2
    ;;
esac

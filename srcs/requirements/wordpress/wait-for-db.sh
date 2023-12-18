#!/bin/bash

usage()
{
	cat << USAGE >&2
Usage: wait-for-db.sh host port timeout_in_sec
USAGE
	exit 1
}

wait_for()
{
    if [[ $WAITFORIT_TIMEOUT -gt 0 ]]; then
        echo "waiting $WAITFORIT_TIMEOUT seconds for $WAITFORIT_HOST:$WAITFORIT_PORT" >&2
    else
        echo "waiting for $WAITFORIT_HOST:$WAITFORIT_PORT without a timeout" >&2
    fi
    WAITFORIT_start_ts=$(date +%s)
    while :
    do
        (echo -n > /dev/tcp/$WAITFORIT_HOST/$WAITFORIT_PORT) >/dev/null 2>&1
        WAITFORIT_result=$?
        if [[ $WAITFORIT_result -eq 0 ]]; then
            WAITFORIT_end_ts=$(date +%s)
            echo "$WAITFORIT_HOST:$WAITFORIT_PORT is available after $((WAITFORIT_end_ts - WAITFORIT_start_ts)) seconds" >&2
            break
        fi
        sleep 1
    done
    return $WAITFORIT_result
}

if [ $# -gt 0 ]; then
	WAITFORIT_HOST=$1
	WAITFORIT_PORT=$2
    WAITFORIT_TIMEOUT=$3
else
	usage
fi

wait_for
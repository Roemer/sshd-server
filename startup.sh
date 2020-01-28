#!/bin/bash

echo ">> Initializing"

echo "root:${SSH_ROOT_PASSWORD}" |chpasswd

exit_script() {
    echo "Received SIGINT or SIGTERM. Shutting down."
    trap - SIGINT SIGTERM # clear the trap
    kill -- -$$ # Sends SIGTERM to child/sub processes
}

echo ">> Running $@"
trap exit_script SIGINT SIGTERM
$@ &
pid="$!"
wait "${pid}" && exit $?

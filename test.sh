#!/bin/bash

# Arg 1 - program to run
# Connect stdin (&0) to stdin of the program
# Connect stdout (&1) to stdout of program
# Connect stderr (&2) to stderr of program
# Run program in the background
$1 <&0 >&1 2>&2 &
# Get the PID of the last program
i=$!
# Arg 2 - the amount of time in sec to wait before killing the program
sleep $2
# Try kill the program, if kill is successful, echo that it was running
# TODO: Make sure that the PID isn't reused!!!
kill $i 2>/dev/null && echo "Time limit exceeded" >&2

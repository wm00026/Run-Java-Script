#!/usr/bin/env bash
# Author: wm00026
# License: MIT


# With no given arguments
if [[ $# -eq  0 ]]; then
    echo "Usage: $0 <JavaFile.java>"
    exit 1
fi

JAVA_FILE=$1

# Checks if the file exits and has proper extension
if [[ ! -f "$JAVA_FILE" ]] || [[ "$JAVA_FILE" != *.java ]]; then
    echo "Error: "$JAVA_FILE" has an improper format or doesn't exist "
    exit 1
fi

# Checks that javac and java are available
if ! command -v javac >/dev/null || ! command -v java >/dev/null; then
    echo "Error: necessary java programs are not found on PATH"
    exit 1
fi

CLASS_NAME=$(basename -- "$JAVA_FILE" .java)
CLASS_DIR=$(dirname -- "$JAVA_FILE")

# Compile w/ extended warnings enabled
echo "=== Compiling $JAVA_FILE ==="
if ! javac -Xdiags:verbose "$JAVA_FILE"; then
    echo "=== Compilation Failed: Fix errors and try again ==="
    exit 1
fi


# Runs the program
echo
echo " === RUNNING $CLASS_NAME ==="
java -cp "$CLASS_DIR" "$CLASS_NAME" "${@:2}"

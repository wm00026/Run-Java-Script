#!/usr/bin/env bash

# Author: wm00026

# Compiles a java file with (javac)
# Reads compile errors/warnings
# Runs the file

# With no given arguments
if [[ $# ==  0 ]]; then
    echo "Usage: $0 <JavaFile.java>"
    exit 1
fi

JAVA_FILE=$1
CLASS_NAME=$(basename "$JAVA_FILE" .java)
CLASS_DIR=$(dirname "$JAVA_FILE")

# Checks if the file exits and has proper extension
if [[ ! -f "$JAVA_FILE" ]] || [[ "$JAVA_FILE" != *.java ]]; then
    echo "Error: "$JAVA_FILE" has an improper format or doesn't exist "
    exit 1
fi

# Checks that javac and java are available
if ! command -v javac >/dev/null; then
    echo "Error: javac not found on PATH"
    exit 1
fi

if ! command -v java >/dev/null; then
    echo "Error: java not found on PATH"
    exit 1
fi


# Compile w/ extended warnings enabled
echo "=== Compiling $JAVA_FILE ==="
javac -Xdiags:verbose "$JAVA_FILE"
COMPILE_STATUS=$?

# Check compile status
if [ $COMPILE_STATUS != 0 ]; then
    echo "=== Compilation failed: Fix errors and try again ==="
    exit $COMPILE_STATUS
fi

# Runs the program
echo
echo " === RUNNING $CLASS_NAME ==="
java -cp "$CLASS_DIR" "$CLASS_NAME" "${@:2}"

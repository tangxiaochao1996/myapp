#!/bin/bash

set -euo pipefail

echo "CC=${CC:=gcc}"
echo "BUILD_DIR=${BUILD_DIR:=build}"
echo "RESULTS_DIR=${RESULTS_DIR:=results}"

echo -n "WORK_LIST=${WORK_LIST:=mem}" | tr "\n" " "; echo
echo -n "PADDING_LIST=${PADDING_LIST:=nop}" | tr "\n" " "; echo

mkdir -p "$BUILD_DIR" "$RESULTS_DIR"

for work in $WORK_LIST; do
    for padding in $PADDING_LIST; do
        start=$(date +%s%3N)
        build_prfx="build/$work.$padding"
        printf %-32s "$work.$padding:"
        echo -n " [gen]"
        python3 microarchitecturometer_generator.py $work $padding > "$build_prfx.c"
        echo -n " [build]"
        $CC "$build_prfx.c" -O3 -o "$build_prfx.out"
        echo -n " [run]"
        "./$build_prfx.out" > "$RESULTS_DIR/$work.$padding.txt"
        echo " $(($(date +%s%3N) - start)) ms"
    done
done
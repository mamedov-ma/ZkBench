#!/bin/bash

run_custom_benchmark () {
    echo "--------------------------------------------------"
    echo "Start: $1"
    echo "--------------------------------------------------"
    pushd $2
    $3
    popd
    echo "--------------------------------------------------"
    echo "Done: $1"
    echo "--------------------------------------------------"
    echo ""
    echo ""
}

export RUST_LOG=info
TIMESTAMP=$(TZ=GMT date '+%Y-%m-%d_%H%M%S')
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
UNIQUE_ID=$(cat /proc/sys/kernel/random/uuid)
CSV_PATH="${SCRIPT_DIR}/data/${TIMESTAMP}_${UNIQUE_ID}.csv"


# Print the date and time in GMT
echo "Time stamp: ${TIMESTAMP}"
echo "CSV path: ${CSV_PATH}"

######################################################################
#               Name            Directory         Command
run_custom_benchmark "My Custom Benchmark 1"   "benchmark1"      "cargo run --release -- --out ${CSV_PATH} all"
run_custom_benchmark "My Custom Benchmark 2"   "benchmark2"      "cargo run --release -- --out ${CSV_PATH} all"

# Print the date and time in GMT
echo -n "End time: "
TZ=GMT date +"%Y%m%d%H%M%S"

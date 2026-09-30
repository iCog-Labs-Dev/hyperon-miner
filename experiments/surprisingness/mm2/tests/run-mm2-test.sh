#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MM2_FILE="$(cd "$SCRIPT_DIR/.." && pwd)/isurp-old-mm2.metta"
TEST_FILE="$SCRIPT_DIR/test-isurp-old-mm2.metta"
DB_FILE="$(cd "$SCRIPT_DIR/../../.." && pwd)/data/ugly_man_sodaDrinker.metta"
TMP_RUN="$SCRIPT_DIR/run_tmp.metta"
RUN_MORK="/home/eyorica/Downloads/patern-mining/run-mork.sh"

echo "========================================="
echo "Running MM2 isurp-old-mm2.metta with MORK"
echo "========================================="

cat "$MM2_FILE" > "$TMP_RUN"
awk 'NF && $1 !~ /^;/ { print "(DB-FACT " $0 ")" }' "$DB_FILE" >> "$TMP_RUN"
cat "$TEST_FILE" >> "$TMP_RUN"

if [ -f "$RUN_MORK" ]; then
    "$RUN_MORK" "$TMP_RUN"
else
    echo "Error: run-mork.sh not found at $RUN_MORK"
    exit 1
fi

rm -f "$TMP_RUN"
echo "========================================="
echo "MORK Test Execution Complete."

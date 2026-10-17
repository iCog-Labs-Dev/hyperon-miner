#!/bin/sh
# Fetch the tested upstream interpreter into this checkout, without system installs.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
PETTA_DIR=${PETTA_PATH:-"$ROOT/.tools/PeTTa"}
REV=$(cat "$ROOT/PETTA_REVISION")
if [ -e "$PETTA_DIR" ]; then
    if [ "$(git -C "$PETTA_DIR" rev-parse HEAD)" != "$REV" ]; then
        echo "Existing PeTTa differs from PETTA_REVISION; choose an empty PETTA_PATH." >&2
        exit 1
    fi
else
    git clone https://github.com/trueagi-io/PeTTa.git "$PETTA_DIR"
    git -C "$PETTA_DIR" checkout --detach "$REV"
fi
printf 'PeTTa ready at %s\nRun: sh scripts/run-petta.sh run_miner.metta\n' "$PETTA_DIR"

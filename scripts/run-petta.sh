#!/bin/sh
# Explicit interpreter selection; no edits to PeTTa or the user's shell profile.
set -eu
ROOT=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
PETTA_DIR=${PETTA_PATH:-"$ROOT/.tools/PeTTa"}
if [ ! -f "$PETTA_DIR/src/main.pl" ]; then
    echo "PeTTa missing: run sh setup.sh or set PETTA_PATH to a checkout." >&2
    exit 1
fi
if [ -n "${VIRTUAL_ENV:-}" ]; then
    # Janus embeds Python: activating a venv alone does not set its module path.
    SITE=$("$VIRTUAL_ENV/bin/python" -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')
    export PYTHONPATH="$SITE${PYTHONPATH:+:$PYTHONPATH}"
fi
exec "${SWIPL:-swipl}" --stack_limit="${PETTA_STACK_LIMIT:-8g}" -q -s "$PETTA_DIR/src/main.pl" -- "$@"

#!/usr/bin/env python3
"""Run the historical CI selection, with logs and strict failure detection."""
import argparse
from concurrent.futures import ThreadPoolExecutor
import os
from pathlib import Path
import subprocess

ROOT = Path(__file__).resolve().parents[1]
NAMES = {'test-isurp-old.metta', 'test-common-utils.metta', 'test-isurp.metta',
         'test-est-tv.metta', 'test-surp.metta', 'test-emp-tv.metta',
         'test-jsd.metta', 'test-pattern-miner.metta'}
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--petta', default=os.environ.get('PETTA_RUNNER', str(ROOT / 'scripts/run-petta.sh')))
parser.add_argument('--logs', type=Path, default=ROOT / 'test-results/regression')
args = parser.parse_args()
runner = str(Path(args.petta).resolve())
args.logs.mkdir(parents=True, exist_ok=True)
files = sorted(p for p in (ROOT / 'experiments').rglob('test-*.metta') if p.name in NAMES)
if len(files) != len(NAMES):
    raise SystemExit(f'Expected {len(NAMES)} test files; found {len(files)}')
def run(path):
    try:
        result = subprocess.run(['sh', runner, str(path)], cwd=ROOT, capture_output=True, text=True, timeout=300)
        output = result.stdout + result.stderr
        code = result.returncode
    except subprocess.TimeoutExpired as exc:
        output, code = str(exc), 124
    (args.logs / (path.stem + '.log')).write_text(output)
    passed = code == 0 and '✅' in output and not any(x in output for x in ('❌', 'ERROR:', 'Traceback'))
    print(f'{"PASS" if passed else "FAIL"}: {path.relative_to(ROOT)}; assertions={output.count("✅")}', flush=True)
    if not passed:
        print(output[-2000:])
    return passed
with ThreadPoolExecutor(max_workers=2) as pool:
    results = list(pool.map(run, files))
print(f'{sum(results)}/{len(results)} test files passed. Unexecuted forms are not tests.')
raise SystemExit(0 if all(results) else 1)

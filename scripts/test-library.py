#!/usr/bin/env python3
"""Test the modified checkout installed in a separate consumer's repos directory."""
import argparse
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile

def parse_sexpr(line):
    tokens = iter(re.findall(r"[()]|[^()\s]+", line))
    def read(token):
        if token != '(':
            return token
        result = []
        for token in tokens:
            if token == ')':
                return result
            result.append(read(token))
        raise ValueError('Unclosed expression')
    return read(next(tokens))


def support_count(pattern, facts):
    """Independent exhaustive join over the three hand-written consumer facts."""
    clauses = pattern[1:] if pattern[0] == ',' else [pattern]
    def unify(term, fact, bindings):
        if isinstance(term, str) and term.startswith('$'):
            if term in bindings:
                return bindings if bindings[term] == fact else None
            return dict(bindings, **{term: fact})
        if isinstance(term, list) and isinstance(fact, list) and len(term) == len(fact):
            for left, right in zip(term, fact):
                bindings = unify(left, right, bindings)
                if bindings is None:
                    return None
            return bindings
        return bindings if term == fact else None
    assignments = [{}]
    for clause in clauses:
        assignments = [new for old in assignments for fact in facts
                       if (new := unify(clause, fact, old)) is not None]
    return len(assignments)


def verify_supports(text):
    facts = [['Likes', 'alice', 'tea'], ['Likes', 'bob', 'tea'], ['Likes', 'cara', 'coffee']]
    records = [parse_sexpr(line) for line in text.splitlines() if line.startswith('(supportOf ')]
    assert records, 'No actual mined output (an unevaluated call is not success)'
    for _, pattern, count in records:
        expected = support_count(pattern, facts)
        assert int(count) == expected and expected >= 2, (pattern, count, expected)
    print(f'Independent support oracle: {len(records)} result records checked')


ROOT = Path(__file__).resolve().parents[1]
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--petta', default=os.environ.get('PETTA_RUNNER'), required=not os.environ.get('PETTA_RUNNER'), help='PeTTa run.sh or executable launcher')
parser.add_argument('--logs', type=Path, default=ROOT / 'test-results' / 'library')
args = parser.parse_args()
runner = Path(args.petta).resolve()
args.logs.mkdir(parents=True, exist_ok=True)
failed = False
with tempfile.TemporaryDirectory(prefix='pattern-miner-consumer-') as tmp:
    consumer = Path(tmp)
    installed = consumer / 'repos' / 'hyperon-miner'
    shutil.copytree(ROOT, installed, ignore=shutil.ignore_patterns('.git', '.venv', '.tools', 'PeTTa', '__pycache__', 'test-results', 'repos'))
    for helper in (ROOT / 'tests/library').glob('*.py'):
        shutil.copy2(helper, consumer / helper.name)
    sources = sorted((ROOT / 'tests/library').glob('*.metta')) + sorted((ROOT / 'examples').glob('*.metta'))
    for source in sources:
        target = consumer / source.name
        shutil.copy2(source, target)
        try:
            result = subprocess.run(['sh', str(runner), str(target)], cwd=consumer, text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, timeout=180)
            output, code = result.stdout, result.returncode
        except subprocess.TimeoutExpired as exc:
            output = str(exc)
            code = 124
        (args.logs / (source.stem + '.log')).write_text(output)
        text = re.sub(r'\x1b\[[0-9;]*m', '', output)
        failures = code != 0 or any(marker in text for marker in ('❌', 'ERROR:', 'Traceback', '(partial PatternMiner.', '(partial pattern-miner ', '(partial frequency-pattern-miner ')) or (source.parent.name != 'examples' and not re.search(r'^"LIBRARY-CONSUMER-DONE"$', text, re.M))
        try:
            if source.name in ('consumer.metta', 'mine.metta'):
                verify_supports(text)
            if source.name == 'surprisingness.metta':
                assert re.search(r'^\(surprisingnessOf ', text, re.M), 'No scored example output'
            if source.name == 'import-only.metta':
                section = text.split('"IMPORT-BEGIN"\n', 1)[1].rsplit('"IMPORT-END"\n', 1)[0]
                assert not re.search(r'^"====|^\(supportOf |^\(surprisingnessOf ', section, re.M), 'Import ran mining'
        except (AssertionError, IndexError, ValueError) as exc:
            print(f'Consumer contract failed: {exc}')
            failures = True
        failed |= failures
        print(f'{"FAIL" if failures else "PASS"}: {source.name}; exit={code}, assertions={text.count("✅")}')
        if failures:
            print(text[-4000:])
raise SystemExit(1 if failed else 0)

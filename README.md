# Pattern Miner for PeTTa

Mine frequent patterns and score their surprisingness from a database supplied by
another MeTTa program. The library uses the root-entry-file and `git-import!`
convention used by [TrueAGI PLN](https://github.com/trueagi-io/PLN), with a small
`PatternMiner.*` API.

The supported pipeline is the functional **generic frequent miner** in
`experiments/frequent-pattern-miner/frequent-pattern-miner-generic.metta` and
`experiments/pattern-miner/pattern-miner.metta`. The separate proof-based miner in
`experiments/miner/` is retained for existing experiments but is not imported by
this library.

## Installation

This working tree is prepared for **`eyobderese/hyperon-miner`**. It has not yet
been published there. Until publication, install this modified checkout locally
as described below; cloning the old repository's default branch will not install
these library changes.

Requirements:

- [PeTTa](https://github.com/trueagi-io/PeTTa), tested at
  `fea83178af3722666d2948d074591d10a3134f56` (also recorded in `PETTA_REVISION`).
- SWI-Prolog with Janus Python interoperability. PeTTa documents **9.3.x or newer**;
  this library was tested with **10.1.14**, Python **3.12.3**, on Linux.
- No third-party Python packages for frequent mining, `isurp`, or `isurp-old`.
- For `jsd` only: NumPy **2.5.4** and SciPy **1.18.1**, pinned in
  `requirements.txt`. Use Python 3.12 for this tested dependency set.

Neither `hyperon` nor `regex` is used by the selected public pipeline. Historical
Python implementations elsewhere in the repository are not loaded by the library.
MORK and FAISS are not required.

Create a consumer workspace with PeTTa and the miner under `repos`:

```bash
mkdir my-mining-project
cd my-mining-project
# Install the interpreter without changing a system installation.
git clone https://github.com/trueagi-io/PeTTa.git PeTTa
git -C PeTTa checkout --detach fea83178af3722666d2948d074591d10a3134f56
mkdir repos
```

**Before publication**, install the modified local checkout:

```bash
cp -R /absolute/path/to/hyperon-miner repos/hyperon-miner
```

**After publication** of this code on the new repository's `main`:

```bash
git clone https://github.com/eyobderese/hyperon-miner.git repos/hyperon-miner
```

The folder name must be `hyperon-miner` to use the imports below. `git-import!`
registers an existing `repos/hyperon-miner` directory without replacing or updating
it. If absent, it clones the URL's default branch. Run from the consumer workspace:
`repos` is relative to the process working directory. Nested library imports are
resolved relative to their source files, including the Python adapter.

## Integration in MeTTa code

Save this complete program as `mine.metta` in `my-mining-project`:

```metta
!(import! &self (library lib_import))
!(git-import! "https://github.com/eyobderese/hyperon-miner.git")
!(import! &self (library hyperon-miner lib_pattern_miner))

;; Named spaces are created by adding atoms in PeTTa.
!(add-atom &my-db (Likes alice tea))
!(add-atom &my-db (Likes bob tea))
!(add-atom &my-db (Likes cara coffee))

!(PatternMiner.Mine &results &my-db 2 0)
!(get-atoms &results)
```

Run it:

```bash
sh PeTTa/run.sh mine.metta
```

This mines conjunctions supported by at least two matches. For a smaller result
with an independently obvious count, replace the mining call with:

```metta
!(PatternMiner.MineWith &results &my-db (Likes $who tea) 2 0 none False 0.2 False)
```

In a fresh process, the output space then contains:

```metta
(supportOf (Likes $who tea) 2)
```

The two supporting facts are Alice's and Bob's tea preferences. Variable names
printed by PeTTa may differ.

Importing `lib_pattern_miner` only loads definitions and its adapter. It does not
load example data, install dependencies, start mining, or bind caller-owned
spaces. PeTTa itself prints translation traces while loading files; the mining
algorithms print progress while running.

## Public API

### `PatternMiner.Mine`

```metta
!(PatternMiner.Mine &output &input minimum-support depth)
```

Equivalent to `PatternMiner.MineWith` with an unconstrained initial pattern,
`none` scoring, normalization `False`, sampling ratio `0.2`, and conjunction
expansion `True`.

### `PatternMiner.MineWith`

```metta
!(PatternMiner.MineWith &output &input $initial minimum-support depth mode normalize sampling-ratio conjunctions)
```

| Argument | Meaning |
| --- | --- |
| `&output` | Caller-owned destination space. Use a different space from the input. |
| `&input` | Caller-owned database of facts; its name need not be `&db`. |
| `$initial` | Unbound variable to search all initial patterns, or a pattern such as `(Likes $who tea)` to constrain specialization. |
| `minimum-support` | Positive integer minimum number of matching fact assignments. For conjunctions this is a join count, not necessarily a count of distinct people/entities. |
| `depth` | Nonnegative integer: `0` builds pairs, `1` extends to triples, and so on when conjunction expansion is enabled. |
| `mode` | `none`, `isurp`, `isurp-old`, or `jsd`. Other symbols return `(Error PatternMiner.UnsupportedMode mode)` without mining. |
| `normalize` | `True` or `False` for `isurp` and `isurp-old`; ignored by `none` and `jsd`. |
| `sampling-ratio` | Positive ratio, typically `0.2`, used by `isurp` probability estimation/sampling; ignored by other modes. |
| `conjunctions` | `True` expands conjunctions; `False` emits specialized single patterns and ignores depth. Use `True` for surprisingness scoring. |

Successful calls **finish the search and return one `()`**; the results are written
to `&output`. They append to existing contents and do not clear the output or
input. Use a fresh output space when you want independent results. The historical
scoring path suppresses matching score records, whereas frequent output can retain
repeated records; do not assume their raw record counts are equal.

Formats are preserved from the existing algorithms:

```metta
(supportOf pattern support-count)          ; mode none
(surprisingnessOf pattern score)           ; scoring modes
```

A conjunction is written `(, clause-1 clause-2 ...)`. Results may vary in variable
names and ordering; compare patterns modulo variable renaming and conjunction
order. Sampling-dependent scoring may vary across runs.

Candidate, conjunction, sorting, and sampled spaces use private generated names;
consecutive calls on different databases do not reuse the caller's `&scores`,
`&cndpspace`, `&conjspace`, or `&subsampled-db`. Avoid using the internal
`&pattern-miner-private-` prefix for caller spaces. This is a library in PeTTa's
shared definition environment, not a namespace sandbox for arbitrary other
implementations of the same internal helper names.

The legacy nine-argument `pattern-miner` entry remains available after import.
Use `PatternMiner.*` for application code. `IIsurp-old` and `IIsurp-new` remain
experimental legacy modes and are not exposed by this public API.

## Surprisingness and Python dependencies

`isurp` and `isurp-old` require no SciPy installation. For `jsd`, install dependencies
explicitly, outside MeTTa import:

```bash
# In my-mining-project, with the Python version used by SWI-Prolog's Janus:
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r repos/hyperon-miner/requirements.txt
export PETTA_PATH="$PWD/PeTTa"
sh repos/hyperon-miner/scripts/run-petta.sh repos/hyperon-miner/examples/surprisingness.metta
```

The launcher adds the active virtual environment's `site-packages` to Janus's
Python path. Activating a venv alone is insufficient for embedded Python. Verify
Janus's Python version with:

```bash
swipl -q -g 'use_module(library(janus)),py_call(sys:version,V),writeln(V),halt'
```

The example uses normalized `isurp`. Change its mode to `jsd` to use SciPy. Missing
SciPy or invalid adapter inputs raise an error rather than returning a false zero
score. Installing dependencies is never an import side effect.

## Examples

From the consumer workspace:

```bash
sh PeTTa/run.sh repos/hyperon-miner/examples/mine.metta
sh PeTTa/run.sh repos/hyperon-miner/examples/surprisingness.metta
```

From the miner checkout, `run_miner.metta` loads the public entry point and runs the
bundled demonstration dataset:

```bash
PETTA_PATH=/absolute/path/to/PeTTa sh scripts/run-petta.sh run_miner.metta
```

## Development and tests

To fetch the tested interpreter into a private `.tools/PeTTa` directory:

```bash
sh setup.sh
python3 -m venv .venv
. .venv/bin/activate
python -m pip install -r requirements.txt
python3 scripts/test-library.py --petta scripts/run-petta.sh
python3 scripts/run-tests.py --petta scripts/run-petta.sh
```

Alternatively set `PETTA_PATH` to an existing interpreter checkout and `SWIPL` to
its intended Prolog executable. `setup.sh` does not install system packages or
modify existing PeTTa checkouts. `PETTA_REVISION` records the tested revision; a
newer upstream revision should be tested before changing that pin.

The library harness copies **this modified working tree** to a temporary external
consumer's `repos/hyperon-miner`, then tests the three-line import, caller data,
known support counts, independent calls, append behavior, and advertised scoring
modes. It does not accidentally test an unchanged GitHub default branch. Logs are
in `test-results/library`. Historical regression logs are in
`test-results/regression`.

The historical selection contains eight test files. Some other forms in those
files lack `!` and do not execute; passing the selection is not a claim that every
legacy experiment works. CI runs both the consumer tests and that regression
selection on `main`, `petta-main`, and `experiment/latest-petta`.

## Verified compatibility

Verified on 17 October 2026 with the pinned PeTTa revision, SWI-Prolog 10.1.14,
and Python 3.12.3:

- `python3 scripts/test-library.py --petta scripts/run-petta.sh`: four consumer
  test programs, **100 passing assertions**, plus both documented examples.
  An independent Python join oracle also checked support counts for all nine
  emitted tiny-dataset records across the consumer and example runs.
- `python3 scripts/run-tests.py --petta scripts/run-petta.sh`: **8/8 files pass,
  124 assertions**.
- `sh scripts/run-petta.sh run_miner.metta`: exit 0 and **76 pattern/support
  records**, with no partial miner calls or errors.
- Core consumers were tested with imports of NumPy and SciPy explicitly blocked.

These are executed local/server checks. The updated GitHub Actions workflow has
not run on GitHub yet. Scoring tests verify the public pipeline against existing
scoring functions; the older regression tests provide fixed numeric expectations.

## License

GNU Affero General Public License v3 — see [LICENCE](LICENCE). The PLN packaging
convention is used as a reference; this project retains its own license.
